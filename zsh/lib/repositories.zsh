[ -d ~/.tmux/plugins ] || mkdir ~/.tmux/plugins

[ -d ~/.tmux/plugins/tpm ] ||
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[ -d $ZSH/plugins/zsh-autopair ] ||
	git clone https://github.com/hlissner/zsh-autopair.git $ZSH/plugins/zsh-autopair

[ -d $ZSH/plugins/zsh-autosuggestions ] ||
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions

[ -d $ZSH/plugins/zsh-abbrev-alias ] ||
	git clone https://github.com/momo-lab/zsh-abbrev-alias.git $ZSH/plugins/zsh-abbrev-alias

[ -f $ZSH/plugins/zsh-autopair/zsh-autopair.plugin.zsh ] &&
	source $ZSH/plugins/zsh-autopair/zsh-autopair.plugin.zsh

[ -f $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] &&
	source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

[ -f $ZSH/plugins/zsh-abbrev-alias/abbrev-alias.plugin.zsh ] &&
	source $ZSH/plugins/zsh-abbrev-alias/abbrev-alias.plugin.zsh
