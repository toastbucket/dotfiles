#! /bin/bash

set -e

##
# Install packages
##
pacman_packages=(
    android-tools minicom openocd ctags
    ripgrep fd docker openssl wget curl
    git rofi vim cmake ctags tig zathura
    cargo firefox
)

pacman_args="--needed --noconfirm"

sudo pacman -Syyu ${pacman_args}
sudo pacman -Sy ${pacman_args} ${pacman_packages[*]}

##
# Install dotfiles
##
rsync -avr --exclude '.git' --exclude 'install.sh' . ~

##
# Configure system
##
sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker ${USER}
