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
# 	print -z -- "tf apply $_cmd"
# }

