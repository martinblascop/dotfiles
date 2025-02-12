alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc ~/.zshrc.local'
alias tmuxrc='vim ~/.tmux.conf'
alias rg='rg --colors match:fg:39 --colors path:fg:36 --colors line:fg:15'
alias vimall='vim *'
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage" # usage dfimage -sV=1.36 <image>
which kubectl > /dev/null && abbrev-alias -g k='kubectl'
which mysqlsh > /dev/null && abbrev-alias -g mysql='mysqlsh'
which tofu > /dev/null && abbrev-alias -g tf='tofu'
abbrev-alias -g dco=docker-compose
abbrev-alias -g km=kustomize
abbrev-alias -g mk=make
