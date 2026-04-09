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
        [$pod.metadata.namespace, $pod.metadata.name, .name, .image] | @tsv' | column -t --table-columns NAMESPACE,POD,CONTAINER,IMAGE 
}
