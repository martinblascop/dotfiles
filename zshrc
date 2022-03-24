# use beam shape cursor
echo -ne '\e[5 q'

# disable ctrl-s
stty -ixon

# disable clobbering
set -C

[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux
[ $? = 1 ] && [ -z "$TMUX" ] && tmux new-session -s default -n home -c "cd"

source $ZSH/init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ "$PATH" != *"$HOME/bin"* ]] && export PATH=$HOME/bin:$PATH
[[ "$PATH" != *"$HOME/.local/bin"* ]] && export PATH=$HOME/.local/bin:$PATH

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q'; }

bindkey '^x^j' edit-command-line
bindkey '^x^u' undo
bindkey '^[y' _copy-region-as-kill

