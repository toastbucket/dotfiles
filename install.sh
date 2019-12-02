#! /bin/bash

set -e

##
# Install packages
##
pacman_packages=(
    android-tools minicom openocd ctags
    ripgrep fd docker openssl wget curl
    git rofi vim cmake ctags tig zathura
    firefox udevil gnome-calculator unzip
)

pacman_uninstall=(
    lightdm palemoon-bin
)

pacman_args="--needed --noconfirm"

sudo pacman -Syyu ${pacman_args}
sudo pacman -Sy ${pacman_args} ${pacman_packages[*]}
sudo pacman -Rcn --noconfirm ${pacman_uninstall[*]}

curl https://sh.rustup.rs -sSf | sh

##
# Install dotfiles
##
rsync -avr --exclude '.git' --exclude 'install.sh' . ~

##
# Configure system
##
sudo systemctl enable docker

sudo groupadd docker
sudo groupadd dialout

sudo usermod -aG docker ${USER}
sudo usermod -aG dialout ${USER}
