#! /bin/bash

set -e

##
# Install and remove packages
##
pacman_packages=(
    android-tools android-udev minicom
    openocd ctags ripgrep fd docker openssl
    wget curl git rofi vim cmake ctags tig
    zathura firefox udevil gnome-calculator
    unzip autorandr
)

pacman_uninstall=(
    lightdm palemoon-bin
)

pacman_args="--needed --noconfirm"

sudo pacman -Syyu ${pacman_args}
sudo pacman -Sy ${pacman_args} ${pacman_packages[*]}

for i in ${pacman_uninstall[@]}; do
	if [ ! sudo pacman -Q $i 2> /dev/null ]; then
		echo "$i installed, removing it"
		sudo pacman -Rcn --noconfirm $i
	fi
done

if [ ! -d ~/.cargo ]; then
	curl https://sh.rustup.rs -sSf | sh
fi

rustup update

##
# Install dotfiles
##
rsync -avr --exclude '.git' --exclude 'install.sh' . ~

##
# Configure system
##
sudo systemctl enable docker
sudo systemctl start docker

if ! grep -q docker /etc/group; then
	echo "docker group not found, adding it"
	sudo groupadd docker
	sudo usermod -aG docker ${USER}
fi

if ! grep -q dialout /etc/group; then
	echo "dialout group not found, adding it"
	sudo groupadd dialout
	sudo usermod -aG dialout ${USER}
fi

