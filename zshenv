# set environment variables
export LANG=en_US.UTF-8
export ZSH=$HOME/.zsh
export CDPATH=$HOME
export EDITOR=$(which vim)
export VISUAL=$EDITOR
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIM_YAML_TREE_FILE_PATH=/tmp/path.yaml.vim

# colorize pattern when searching with less
export LESS_TERMCAP_so=$'\e[01;33m' # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'     # reset reverse video
