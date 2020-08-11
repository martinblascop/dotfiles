if [[ "$OSTYPE" == "Linux" ]];then
	alias ls='ls --color=tty'
	[ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"
	LS_COLORS="$LS_COLORS:ow=34;1;4"
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
	alias ls='ls -G'
	export CLICOLOR=1
	export LSCOLORS=BxGxdxdxCxegedabagacad
	zstyle ':completion:*:default' list-colors ''
fi
