function _dynamic_alias {
    source $ZSH/lib/alias.zsh
}

precmd_functions+=(_dynamic_alias)
