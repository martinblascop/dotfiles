if [[ "$OSTYPE" == "Linux" ]];then
	alias ls='ls --color=tty'
else
	alias ls='ls -G'
fi

[ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"

LS_COLORS="$LS_COLORS:ow=34;1;4"
