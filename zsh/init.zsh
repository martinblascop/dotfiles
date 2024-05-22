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

for config_file ($ZSH/lib/*.zsh); do
	source $config_file
done
