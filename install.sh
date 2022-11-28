#! /bin/bash

set -e

pacman_packages=(
    android-tools android-udev minicom
    openocd ctags ripgrep fd docker openssl
    wget curl git rofi gvim cmake ctags tig
    zathura gnome-calculator zsh
    unzip autorandr libreoffice diff-so-fancy
    repo alacritty pulseaudio xclip flameshot
)

pacman_uninstall=(
    lightdm palemoon-bin vim
)

pacman_args="--needed --noconfirm"

install_system_packages() {
    sudo pacman -Syyu ${pacman_args}

    echo ""
    echo "########################"
    echo "Attempting to uninstall:"
    echo "${pacman_uninstall[@]}"
    echo "########################"

    for i in ${pacman_uninstall[@]}; do
            if sudo pacman -Q $i 2> /dev/null; then
                    echo "$i installed, removing it"
                    sudo pacman -Rcn --noconfirm $i
            else
                    echo "$i not installed, skipping"
            fi
    done

    echo ""
    echo "########################"
    echo "Attempting to install:"
    echo "${pacman_packages[@]}"
    echo "########################"

    sudo pacman -Sy ${pacman_args} ${pacman_packages[*]}


    if [ ! -d ~/.cargo ]; then
            curl https://sh.rustup.rs -sSf | sh
    fi

    source $HOME/.cargo/env
    rustup update

    touch installed
}

configure_shell() {
    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    sudo usermod -s /bin/zsh ${USER}
}

install_dotfiles() {
    rsync -avr --exclude '.git' --exclude 'install.sh' --exclude "installed" . ~
}

configure_system() {
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
}

install_system_packages
configure_shell
install_dotfiles
configure_system

