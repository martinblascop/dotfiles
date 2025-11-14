# use beam shape cursor
echo -ne '\e[5 q'

# disable ctrl-s
stty -ixon

# disable clobbering
set -C

source $ZSH/init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME=~/.config

[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux
[ $? = 1 ] && [ -z "$TMUX" ] && tmux new-session -s default -n home -c "cd"

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q'; }

bindkey '^x^j' edit-command-line
bindkey '^x^u' undo
bindkey '^[y' _copy-region-as-kill
bindkey '^v' _paste-from-clipboard

alias history='history -n 0' # do not show line numbers. More in `man zshbuiltins`

source "${HOME}/.fzf/shell/key-bindings.zsh"
