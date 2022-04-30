# Detect which UNIX like OS is running
UNAME_S := $(shell uname -s)
bash: common
	cp .bashrc ~/.bashrc
	cp .bash_aliases ~/.bash_aliases
	cp .bash_profile ~/.bash_profile
	sudo chsh -s $(shell which bash) $(shell whoami)

zsh: common
ifeq (, $(shell which zsh))
	brew install zsh
endif
	cp .zshrc ~/.zshrc
	cp .zprofile ~/.zprofile
	sudo chsh -s $(shell which zsh) $(shell whoami)

common:
	brew update
	brew upgrade
ifeq (, $(shell which git))
	brew install git
	brew install gh
endif
ifeq (, $(shell which tmux))
	brew install tmux
endif
ifeq (, $(shell which vim))
	brew install vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif
ifeq (, $(shell which wezterm))
	brew install --cask wezterm
endif
ifeq (, $(shell which ag))
	brew install ag
endif
	cp .wezterm.lua ~/.wezterm.lua
	cp .editorconfig ~/.editorconfig
	cp .tmux.conf ~/.tmux.conf
	cp .vimrc ~/.vimrc
