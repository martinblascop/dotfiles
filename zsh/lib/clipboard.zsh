OSTYPE=`uname`

if [[ "$OSTYPE" == "Linux" ]];then
	alias getclip='xclip -selection clipboard -o'
	alias setclip='xclip -selection clipboard'
else
	alias getclip='pbpaste'
	alias setclip='pbcopy'
fi


_copy-region-as-kill () {
	zle end-of-line
	zle copy-region-as-kill
	print -rn $CUTBUFFER | setclip
	RBUFFER=" # copied $RBUFFER"
}

zle -N _copy-region-as-kill

# overwrite zsh bracketed-paste to remove newline character
bracketed-paste() {
  zle .$WIDGET && LBUFFER=${LBUFFER%$'\n'}
}

zle -N bracketed-paste

_paste-from-clipboard () {
    CUTBUFFER=`getclip`
    zle yank
}

zle -N _paste-from-clipboard
