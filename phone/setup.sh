#!/bin/sh

# manually install openssh

# make sure we're in the right directory and up-to-date
cd ~
pkg upgrade

# set up storage
pkg install termux-setup-storage
mkdir storage
echo "y" | termux-setup-storage

# install all programs
xargs -a storage/shared/sync/dox/configs/phone/installed-pkgs.txt pkg install

# cp restow
cp storage/shared/sync/dox/configs/phone/stow/bin/home/restow .
rm ../usr/etc/bash.bashrc
./restow
rm restow
