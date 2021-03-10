#!/bin/sh

# make sure we're in the right directory and up-to-date
cd $HOME
echo "updating software"
pkg upgrade


# install all programs
echo "installing new packages"
xargs -a $HOME/termux_dotfiles/phone/installed-pkgs.txt pkg install

# set up storage
echo "setting up storage"
mkdir storage
echo "y" | termux-setup-storage

# stow dotfiles
echo "stowing configs"
rm $HOME/../usr/etc/bash.bashrc
stow -t /data/data/com.termux/files * 2>&1 | grep -A 2 -E "^WARNING"
