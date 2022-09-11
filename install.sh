#!/bin/sh
set -e

cd ~

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "Homebrew already installed."
fi

# Install some software
# echo "Installing some software & library..."
# brew bundle -v --file=~/.dotfiles/Brewfile

#.congigなければ作成
if [ ! -d ~/.config ]; then
	echo "Creating ~/.config directory..."
	mkdir ~/.config
else
	echo ".config already maked"
fi

stow -v -d ~/.dotfiles -t ~  fish nvim karabiner tmux tig

echo "Success"
