function dynamic_alias {
    source $ZSH/lib/alias.zsh
}

precmd_functions+=(dynamic_alias)
