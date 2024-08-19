if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

alias python='python -m IPython'
