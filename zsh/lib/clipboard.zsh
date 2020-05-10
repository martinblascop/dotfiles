OSTYPE=`uname`

if [[ "$OSTYPE" == "Linux" ]];then
	alias getclip='xclip -selection clipboard -o'
	alias setclip='xclip -selection clipboard'
else
	alias getclip='pbcopy'
	alias setclip='pbpaste'
fi


_copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xclip -selection clipboard
  print -n ' # copied '
}

zle -N _copy-region-as-kill

bindkey "^[y" _copy-region-as-kill
