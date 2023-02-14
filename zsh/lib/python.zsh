if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

if which ipython > /dev/null 2>&1; then
  alias python=ipython
fi
