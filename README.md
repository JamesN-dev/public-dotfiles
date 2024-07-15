### Dotfiles Configuration

This --bare repository contains some configuration files for my macOS development environment. These are not necessarily set up to share and may contain hardcoded paths. This is more saved for myself if I ever need to reload my config files.

## Structure

- .config/nvim: NeoVim configuration files.
- .oh-my-zsh/custom: Custom Oh My Zsh aliases. 
- .p10k.zsh: Powerlevel10k configuration. //Pretty much stock


## Update Script

To update the configuration files, use the scripts in `commit-instruct.nfo`.
	
	#GENERIC SCRIPT
1.	#Add, commit, and push changes to your dotfiles repository:
		publicconfig add $HOME/Developer/[addyourfilehere]
		publicconfig commit -m "Commit message"
		publicconfig push -u origin main
	
	#PREMADE SCRIPTS
	#vim-quick-cheat.txt
		publicconfig add $HOME/Developer/cheatsheets/vim-quick-cheat.txt
		publicconfig commit -m "Added custom keymap shortcuts"
		publicconfig push -u origin main
		
	#nvim config
		publicconfig add $HOME/.config/nvim
		publicconfig commit -m "Adding my nvim config"
		publicconfig push -u origin main
		
	#Other configs in Developer/.configfiles
		publicconfig add $HOME/Developer/.config-files/
		publicconfig commit -m "Added Brewfile.nfo"
		publicconfig push -u origin main
		
		
## Setup on a New Machine

		# Clone the repository:
	
		git clone --bare git@github.com:JamesN-dev/public-dotfiles.git $HOME/.public-dotfiles
		
		# Create the publicconfig aliases
		alias publicconfig='/usr/bin/git --git-dir=$HOME/.public-dotfiles/ --work-tree=$HOME'
		publicconfig config --local status.showUntrackedFiles no
		echo "alias publicconfig='/usr/bin/git --git-dir=$HOME/.public-dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
		source $HOME/.zshrc
		
		# Checkout
		publicconfig checkout
		publicconfig config --local status.showUntrackedFiles no
