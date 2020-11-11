# load the auto-completions
autoload -Uz compinit && compinit

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

for config_file ($ZSH/lib/*.zsh); do
	source $config_file
done
