OSTYPE=`uname`

if [[ "$OSTYPE" == "Linux" ]];then
	alias ls='ls --color=tty'
	alias getclip='xclip -selection clipboard -o'
	alias setclip='xclip -selection clipboard'
else
	alias ls='ls -G'
fi

[ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"

LS_COLORS="$LS_COLORS:ow=34;1;4"

setopt auto_cd
setopt multios
setopt prompt_subst

[[ -n "$WINDOW" ]] && SCREEN_NO="%B$WINDOW%b " || SCREEN_NO=""
