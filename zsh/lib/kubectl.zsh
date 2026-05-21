kubectl-node-allocatable() {
    echo -e "\033[33mshow node allocatable resources\033[0m"
    kubectl describe nodes $@ | awk ' /^$/ { print; next } /^[^[:space:]]/ { p = ($0 ~ /^(Name|Labels|Capacity|Allocatable|Allocated resources):/) } p '
}

kubectl-resource-metadata() {
    echo -e "\033[33mshow resource kind and metadata\033[0m"
    kubectl get $@ -o yaml | yq -o=json '.' | jq '.items | map({kind, metadata})' | yq -P '.'
}

kubectl-pod-resources() {
    echo -e "\033[33mpods without resources defined\033[0m"
    kubectl get pods $@ -o json | jq -r '
        .items[] | . as $pod | .spec.containers[] |
        select(
          .resources.requests == null or
          .resources == {}
        ) |
        [$pod.metadata.namespace, $pod.metadata.name, .name] | @tsv' | column -t --table-columns NAMESPACE,POD,CONTAINER
}

kubectl-pod-restarts() {
    echo -e "\033[33mpods with restart\033[0m"
    kubectl get pods $@ -o json | jq -r '
        .items[] | select(.status.containerStatuses[]?.restartCount > 0) |
        "\(.metadata.namespace)\t\(.metadata.name)\t\(.status.containerStatuses[].restartCount)"' | column -t --table-columns NAMESPACE,POD,RESTARTS
}

kubectl-pod-image() {
    echo -e "\033[33mlist pods tag version\033[0m"
    kubectl --context sandbox get pods $@ -o json | jq -r '
        .items[] | . as $pod | .spec.containers[] |
        [$pod.metadata.namespace, $pod.metadata.name, .name, .image, $pod.status.startTime] | @tsv' | column -t --table-columns NAMESPACE,POD,CONTAINER,IMAGE,START
}

kubectl-owners() {
    local json
    json=$(kubectl get "$@" -o json) || return $?
    # Script on fd 3; JSON still arrives on stdin (avoids heredoc end-marker indentation issues).
    printf '%s' "$json" | python3 /dev/fd/3 3<<'PY' | column -t -s $'\t'
import json, sys

def load_obj(raw):
    try:
        return json.loads(raw, strict=False)
    except TypeError:
        return json.loads(raw)

def fmt_bool(v):
    if v is True:
        return "true"
    if v is False:
        return "false"
    if v is None:
        return "-"
    return str(v).lower()

def add_rows(lines, ns, nm, rk, owners):
    ns = "-" if ns in (None, "") else str(ns)
    nm = "-" if nm in (None, "") else str(nm)
    rk = "-" if rk in (None, "") else str(rk)
    owners = owners or []
    if not owners:
        lines.append([ns, nm, rk, "-", "-", "-", "-", "-", "-"])
        return
    for o in owners:
        blk = o.get("blockOwnerDeletion")
        lines.append([
            ns, nm, rk,
            str(o.get("kind") or "-"),
            str(o.get("name") or "-"),
            str(o.get("apiVersion") or "-"),
            fmt_bool(o.get("controller", False)),
            fmt_bool(blk) if blk is not None else "-",
        ])

raw = sys.stdin.read()
obj = load_obj(raw)
lines = []

if obj.get("kind") == "List":
    items = obj.get("items") or []
    if not items:
        print("No resources returned.")
        raise SystemExit(0)
    for item in items:
        md = item.get("metadata") or {}
        add_rows(lines, md.get("namespace"), md.get("name"), item.get("kind"), md.get("ownerReferences"))
else:
    md = obj.get("metadata") or {}
    add_rows(lines, md.get("namespace"), md.get("name"), obj.get("kind"), md.get("ownerReferences"))

hdr = (
    "NAMESPACE", "RESOURCE", "RESOURCE_KIND",
    "OWNER_KIND", "OWNER_NAME", "OWNER_APIVERSION",
    "CONTROLLER", "BLOCK_OWNER_DELETION",
)
print("\t".join(hdr))
for row in lines:
    print("\t".join(row))
PY
}
