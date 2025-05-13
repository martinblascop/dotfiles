# use beam shape cursor
echo -ne '\e[5 q'

# disable ctrl-s
stty -ixon

# disable clobbering
set -C

source $ZSH/init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ "$PATH" != *"$HOME/bin"* ]] && export PATH=$HOME/bin:$PATH
[[ "$PATH" != *"$HOME/.local/bin"* ]] && export PATH=$HOME/.local/bin:$PATH

[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux
[ $? = 1 ] && [ -z "$TMUX" ] && tmux new-session -s default -n home -c "cd"

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q'; }

bindkey '^x^j' edit-command-line
bindkey '^x^u' undo
bindkey '^[y' _copy-region-as-kill

alias history='history -n 0' # do not show line numbers. More in `man zshbuiltins`

source "${HOME}/.fzf/shell/key-bindings.zsh"
