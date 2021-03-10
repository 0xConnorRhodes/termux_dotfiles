#!/bin/sh

# make sure we're in the right directory and up-to-date
cd $HOME
pkg upgrade

# set up storage
pkg install termux-setup-storage
mkdir storage
echo "y" | termux-setup-storage

# install all programs
xargs -a $HOME/termux_dotfiles/phone/installed-pkgs.txt pkg install

# stow dotfiles
rm $HOME/../usr/etc/bash.bashrc
stow -t /data/data/com.termux/files * 2>&1 | grep -A 2 -E "^WARNING"
