#!/bin/sh

# make sure we're in the right directory and up-to-date
cd $HOME
echo "==UPDATING SOFTWARE=="
pkg upgrade


# install all programs
echo "==INSTALLING NEW PACKAGES=="
xargs -a $HOME/termux_dotfiles/phone/installed-pkgs.txt pkg install

# set up storage
echo "==SETTING UP STORAGE=="
mkdir storage
echo "y" | termux-setup-storage

# stow dotfiles
echo "==STOWING CONFIGS=="
rm $HOME/../usr/etc/bash.bashrc
cd $HOME/termux_dotfiles/phone/stow
stow -t /data/data/com.termux/files * 2>&1 | grep -A 2 -E "^WARNING"
