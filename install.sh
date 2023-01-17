#! /bin/bash

set -e

pacman_packages=(
    android-tools android-udev minicom
    openocd ctags ripgrep fd docker openssl
    wget curl git rofi gvim cmake ctags tig
    zathura gnome-calculator zsh waybar light
    unzip autorandr libreoffice diff-so-fancy
    repo alacritty xclip flameshot
    manjaro-pulse yay sway swayidle swaybg
    wl-clipboard wl-copy grim slurp
)

aur_packages=(
    ncpamixer swaylock-effects
)

pacman_uninstall=(
    palemoon-bin vim
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
    echo "######################################"
    echo "Attempting to install pacman packages:"
    echo "${pacman_packages[@]}"
    echo "######################################"

    sudo pacman -Sy ${pacman_args} ${pacman_packages[*]}

    echo ""
    echo "###################################"
    echo "Attempting to install AUR packages:"
    echo "${aur_packages[@]}"
    echo "###################################"

    yay -S ${aur_packages[*]}

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
    rsync -avr --exclude '.git' --exclude 'install.sh' --exclude "installed" --exclude "files" . ~
}

install_files() {
    sudo cp files/90-backlight.rules /etc/udev/rules.d/90-backlight.rules
}

check_and_add_group() {
    local group=$1
    local groups=$(groups)
    local user_groups=$(groups ${USER})

    if [[ ! "${user_groups}" == *"${group}"* ]];then
        echo "not in docker group"
        if [[ ! "${groups}" == *"docker"* ]];then
            echo "docker group doesn't exist, fixing that."
            sudo groupadd ${group}
        fi
        sudo usermod -aG $group ${USER}
    fi
}

configure_system() {
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo systemctl enable systemd-timesyncd
    sudo systemctl start systemd-timesyncd
    sudo systemctl disable lightdm

    check_and_add_group "dialout"
    check_and_add_group "docker"
    check_and_add_group "video"
    check_and_add_group "wheel"

    install_files

    sudo udevadm control --reload
    sudo udevadm trigger

}

install_system_packages
configure_shell
install_dotfiles
configure_system

