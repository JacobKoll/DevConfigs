# Detect which UNIX like OS is running
UNAME_S := $(shell uname -s)
bash: common
	cp .bashrc ~/.bashrc
	cp .bash_aliases ~/.bash_aliases
	cp .bash_profile ~/.bash_profile
	sudo chsh -s $(shell which bash) $(shell whoami)

zsh: common
	brew install zsh
	cp .zshrc ~/.zshrc
	cp .zprofile ~/.zprofile
	sudo chsh -s $(shell which zsh) $(shell whoami)

common:
	brew update
	brew upgrade
	brew install tmux
	brew install vim
	rm -rf ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	brew install ag
	cp .editorconfig ~/.editorconfig
	cp .tmux.conf ~/.tmux.conf
	cp .vimrc ~/.vimrc
