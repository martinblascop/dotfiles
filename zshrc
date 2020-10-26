# use beam shape cursor
echo -ne '\e[5 q'

# disable ctrl-s
stty -ixon

# set tab stop to 4
tabs 4

# disable clobbering
set -C

source $ZSH/init.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q'; }

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd  ]] || [[ $1 = 'block'  ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main  ]] || [[ ${KEYMAP} == viins  ]] || [[ ${KEYMAP} = ''  ]] || [[ $1 = 'beam'  ]]; then
		echo -ne '\e[5 q'
	fi
}

zle -N zle-keymap-select

bindkey '^x^j' edit-command-line
bindkey '^x^u' undo
bindkey '^[y' _copy-region-as-kill

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias rg='rg --colors match:fg:24'
