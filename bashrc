# expand history
shopt -s histverify

# disable clobbering, to overwrite use |&
set -o noclobber

# disable ctrl-s
stty -ixon

# prompt settings
PS1='\s \w\n\$ '
PROMPT_COMMAND="printf '\n'"

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
