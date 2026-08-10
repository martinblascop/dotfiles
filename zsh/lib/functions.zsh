# Set variable "$1" to default value "$2" if "$1" is not yet defined.
#
# Arguments:
#    1. name - The variable to set
#    2. val  - The default value
# Return value:
#    0 if the variable exists, 3 if it was set
#
function default() {
    (( $+parameters[$1] )) && return 0
    typeset -g "$1"="$2"   && return 3
}

#
# Set environment variable "$1" to default value "$2" if "$1" is not yet defined.
#
# Arguments:
#    1. name - The env variable to set
#    2. val  - The default value
# Return value:
#    0 if the env variable exists, 3 if it was set
#
function env_default() {
    (( ${${(@f):-$(typeset +xg)}[(I)$1]} )) && return 0
    export "$1=$2" && return 3
}

function t {
    tmux "$@"
}

function path {
    sed 's/:/\n/g' <<< $PATH
}

# set "ñ" character to clipboard
function ene {
    printf '\U0000F1' | setclip
}

# example of dinamically prefilling a command for next prompt
# target () {
# 	_cmd=`for i in {1..$1} ; do printf "-target '' " ; done`
# 	print -z -- "tofu apply $_cmd"
# }

# Print whitespace-aligned tabular output vertically, MySQL "\G" style.
# Column headers and values must be single tokens (no embedded spaces) --
# true for most kubectl/ps output. Stray title/footer lines whose field
# count differs from the table body are ignored automatically.
#
# Usage:
#    kubectl get pods   | vtable
#    list-pods-with-title | vtable     # leading colored title is dropped
#
function vtable {
    awk '
        { gsub(/\033\[[0-9;]*m/, ""); buf[NR] = $0; if (NF > 0) cnt[NF]++ }
        END {
            # table width = the most common field count (ignores title lines)
            for (k in cnt) if (cnt[k] > best) { best = cnt[k]; W = k }
            for (i = 1; i <= NR; i++) {
                $0 = buf[i]
                if (NF != W) continue
                if (!hdr) {
                    for (j = 1; j <= W; j++) { h[j] = $j; if (length($j) > w) w = length($j) }
                    hdr = 1; continue
                }
                printf "*************************** %d ***************************\n", ++r
                for (j = 1; j <= W; j++) printf "%*s: %s\n", w, h[j], $j
            }
        }
    '
}

function yamlkeys {
  if [[ -z "$1" || ! -f "$1" ]]; then
    echo "Usage: yamlkeys <file.yaml>" >&2
    return 1
  fi
  yq eval 'keys | .[]' "$1"
}

function argodiff {
    git show origin/main:$2 | yq '.spec.source.helm.valuesObject' >! /tmp/values-base.yaml
    yq '.spec.source.helm.valuesObject' $2 >! /tmp/values-target.yaml
    for v in base target; do
      helm template `yq .spec.source.helm.releaseName $2` $1 -n `yq .metadata.namespace $2` -f /tmp/values-$v.yaml >! /tmp/$v.yaml
    done
    dyff between /tmp/base.yaml /tmp/target.yaml --omit-header
}
