alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias rg='rg --colors match:fg:24'

alias vimall='vim *'
alias dco='docker-compose'
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage" # usage dfimage -sV=1.36 <image>
which kubectl > /dev/null && alias k='kubectl'
