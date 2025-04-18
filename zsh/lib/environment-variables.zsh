# Docker
export BUILDKIT_PROGRESS=plain
export BUILDKIT_COLORS="run=green:warning=yellow:error=red:cancel=cyan"
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# fzf
export FZF_DEFAULT_OPTS='--multi'

# aws
export AWS_PAGER=""

# github cli
export GH_PAGER=""

# kubectl krew plugin
export KREW_ROOT=~/.krew/bin
export PATH=$PATH:$KREW_ROOT
export KUBECTL_EXTERNAL_DIFF="colordiff -N -U 10"
export KUBE_EDITOR=$EDITOR

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# tofu
export TF_CLI_ARGS_fmt="-recursive"

# k9s
export K9S_FEATURE_GATE_NODE_SHELL=true

[ `uname -s` = "Darwin" ] && export PATH=$PATH:/opt/homebrew/bin
