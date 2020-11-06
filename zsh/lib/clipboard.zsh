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
