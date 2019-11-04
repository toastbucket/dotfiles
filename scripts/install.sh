#! /bin/bash

if [ $(id -u) != 0 ]; then
    echo "Please run as root"
    exit 1
fi    

# variables
pacman_packages=(
    android-tools minicom openocd ctags
    ripgrep fd docker openssl wget curl 
    git rofi vim 
)

pacman_args="--needed --noconfirm"


# update packages
sudo pacman -Syyu ${pacman_args}

# install packages
sudo pacman -Sy ${pacman_args} ${pacman_all[*]}
