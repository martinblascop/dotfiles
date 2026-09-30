# load the auto-completions
autoload -Uz compinit && compinit

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

if [[ -z "$ZSH_CACHE_DIR" ]]; then
    ZSH_CACHE_DIR="$ZSH/cache"
fi

# Create cache and completions dir and add to $fpath
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# environment-variables.zsh goes early so PATH (e.g. krew plugins) is set before alias.zsh runs `kubectl ctx`
config_files=($ZSH/lib/repositories.zsh $ZSH/lib/environment-variables.zsh $ZSH/lib/*.zsh)
for config_file (${(u)config_files}); do
    source $config_file
done
