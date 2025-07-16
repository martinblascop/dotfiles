# Docker
export BUILDKIT_PROGRESS=plain
export BUILDKIT_COLORS="run=green:warning=yellow:error=red:cancel=cyan"
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# fzf
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS --with-nth 2.."
export FZF_CTRL_T_COMMAND='rg --hidden -l ""'
export FZF_DEFAULT_OPTS='--multi --cycle --color pointer:#ff6c00'

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

# nvm
export NVM_DIR=~/.nvm

# tofu
export TF_CLI_ARGS_fmt="-recursive"
export TF_CLI_ARGS_state_show="-show-sensitive"

# k9s
export K9S_FEATURE_GATE_NODE_SHELL=true

[ `uname -s` = "Darwin" ] && export PATH=$PATH:/opt/homebrew/bin
