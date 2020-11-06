# load the auto-completions
autoload -Uz compinit && compinit

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

for config_file ($ZSH/lib/*.zsh); do
	source $config_file
done

[ -f $ZSH/plugins/zsh-autopair/zsh-autopair.plugin.zsh ] &&
	source $ZSH/plugins/zsh-autopair/zsh-autopair.plugin.zsh
[ -f $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] &&
	source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
