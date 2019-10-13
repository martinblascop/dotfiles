# Use beam shape cursor
echo -ne '\e[5 q'


# Set env variables
export ZSH=$HOME/.zsh
export EDITOR=$(which vim)
export LANG=en_US.UTF-8
export FZF_CTRL_T_COMMAND='rg --hidden -l ""'

set -C
source $ZSH/init.zsh
[ -f ~/.zsh/local.zsh ] && source ~/.zsh/local.zsh
[ -f ~/.tmux/sessions.tmux ] && source ~/.tmux/sessions.tmux 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

LS_COLORS="$LS_COLORS:ow=34;1;4"

# Use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q' ;}

alias ls='ls -F --color=auto'
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmuxrc="vim ~/.tmux.conf"
alias getclip='xclip -selection clipboard -o'
alias setclip='xclip -selection clipboard'

bindkey "^j" vi-cmd-mode
bindkey "^[l" autosuggest-accept

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd  ]] || [[ $1 = 'block'  ]]; then
	echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main  ]] || [[ ${KEYMAP} == viins  ]] || [[ ${KEYMAP} = ''  ]] || [[ $1 = 'beam'  ]]; then
	echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
