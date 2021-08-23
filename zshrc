# use beam shape cursor
echo -ne '\e[5 q'

# disable ctrl-s
stty -ixon

# disable clobbering
set -C

source $ZSH/init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ "$PATH" != *"$HOME/bin"* ]] && export PATH=$HOME/bin:$PATH
[[ "$PATH" != *"$HOME/.local/bin"* ]] && export PATH=$HOME/.local/bin:$PATH

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q'; }

bindkey '^x^j' edit-command-line
bindkey '^x^u' undo
bindkey '^[y' _copy-region-as-kill

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias rg='rg --colors match:fg:24'
