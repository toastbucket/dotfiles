#! /bin/bash

set -e

##
# Install packages
##
pacman_packages=(
    android-tools minicom openocd ctags
    ripgrep fd docker openssl wget curl 
    git rofi vim cmake ctags tig 
)

pacman_args="--needed --noconfirm"

sudo pacman -Syyu ${pacman_args}
sudo pacman -Sy ${pacman_args} ${pacman_all[*]}

##
# Install dotfiles
##
rsync -avr --exclude '.git' --exclude 'install.sh' . ~
