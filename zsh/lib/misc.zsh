env_default 'PAGER' 'less'
env_default 'LESS' '-R'

autoload -Uz is-at-least

# jobs
setopt long_list_jobs


# super user alias
alias _='sudo'

# recognize comments
setopt interactivecomments
