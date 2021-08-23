function ls-style {
	alias ls='ls --color=tty'
	[ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"
	LS_COLORS="$LS_COLORS:ow=34;1;4"
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
}

[[ "$OSTYPE" == "Linux" ]] && ls-style && exit 0

if [[ -d /usr/local/opt/coreutils/libexec/gnubin/ ]] ; then
	[[ "$PATH" != *"libexec/gnubin"* ]] && export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	export QUOTING_STYLE=literal
	ls-style
else
	alias ls='ls -G'
	export CLICOLOR=1
	export LSCOLORS=BxGxdxdxCxegedabagacad
	zstyle ':completion:*:default' list-colors ''
fi
