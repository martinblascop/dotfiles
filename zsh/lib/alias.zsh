alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage" # usage dfimage -sV=1.36 <image>
alias diff='colordiff'
alias rg='rg --colors match:fg:39 --colors path:fg:36 --colors line:fg:15 --hidden --glob "!.git"'
alias tmuxrc='vim ~/.tmux.conf'
alias vimall='vim *'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc ~/.zshrc.local'

which kubectl > /dev/null && abbrev-alias -g k="kubectl --context `kubectl ctx -c`"
which mysqlsh > /dev/null && abbrev-alias -g mysql='mysqlsh'
which tofu > /dev/null && abbrev-alias -g tf='tofu'

abbrev-alias -g aw="aws --profile $AWS_PROFILE"
abbrev-alias -g dco=docker-compose
abbrev-alias -g km=kustomize
abbrev-alias -g mk=make
