# Docker
export BUILDKIT_PROGRESS=plain
export DOCKER_DEFAULT_PLATFORM=linux/amd64


# aws
export AWS_PAGER=""

# github cli
export GH_PAGER=""

# kubectl krew plugin
export KREW_ROOT=~/.krew/bin
export PATH=$PATH:$KREW_ROOT
export KUBECTL_EXTERNAL_DIFF="colordiff -N -U 10"

[ `uname -s` = "Darwin" ] && export PATH=$PATH:/opt/homebrew/bin
