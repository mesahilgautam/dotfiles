#!/bin/bash

function setup() {
    # change shell
    sudo echo "/usr/bin/zsh" >> /etc/shells
    chsh -s $(which zsh)
    sudo chsh -s $(which zsh)

    # tpm(tmux plugin manager) install for tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # setup all symbolic links
    mkdir -p ~/.config
    mkdir -p ~/.cache

    ![ -d "~/repos" ] && break

	sudo ln -s ~/repos/dotfiles/nvim ~/.config/nvim
	sudo ln -s ~/repos/dotfiles/dunst ~/.config/dunst
	sudo ln -s ~/repos/dotfiles/gtk-3.0 ~/.config/gtk-3.0
	sudo ln -s ~/repos/dotfiles/mpv ~/.config/mpv
	sudo ln -s ~/repos/dotfiles/newsboat ~/.config/newsboat
	sudo ln -s ~/repos/dotfiles/tmux ~/.config/tmux
	sudo ln -s ~/repos/dotfiles/wal.config ~/.config/wal
	sudo ln -s ~/repos/dotfiles/wal.cache ~/.cache/wal

	sudo ln -s ~/repos/dotfiles/yt-dlp ~/.config/yt-dlp
	sudo ln -s ~/repos/dotfiles/nvim ~/.config/nvim
	sudo ln -s ~/repos/dotfiles/nvim ~/.config/nvim
	sudo ln -s ~/repos/dotfiles/fonts /usr/share/fonts/f

	sudo ln -s ~/repos/dotfiles/.xinitrc ~/.xinitrc
	sudo ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
	sudo ln -s ~/repos/dotfiles/.zprofile ~/.zprofile
    sudo ln -s ~/repos/dotfiles/zsh.cache ~/.cache/zsh

    export PATH="/home/$USER/repos/dotfiles/bin:$PATH"

    # init system calls
    # docker
    # qemukvm
    #
    sudo usermod -aG video $USER
    ~/repos/dotfiles/bin/buildsuckless

    # touchpad settings
    sudo printf "Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "on"
    Option "ClickMethod" "clickfinger"
    EndSection" > /etc/X11/xorg.conf.d/30-touchpad.conf

    # group settings
}


function packageInstall() {
    packages=(
        "brave-bin"
        "xorg-server"
        "xorg-xinit"
        "xorg-xrandr"
        "xorg-setxkbmap"
        "xorg-xset"
        "libpulse"

        "neovim"
        "clang"
        "npm"
        "make"
        "xwallpaper"
        "xcompmgr"
        "xsel"
        "xclip"
        "light"
        "libnotify"
        "dunst"
        "flameshot"
        "zsh"
        "zsh-syntax-highlighting-git"
        "yt-dlp"
        "newsboat"
        "yt-dlp"
        "delta-git"
        "btop"
        "xdotool"
        "gtypist"
        "neomutt" # use with luke's muttwizard
        "thunar"
        "tmux"
        "weechat"
        "docker"
        "unzip"
        "ripgrep"
        "delta-git"
        # ""
        # ""
        # ""
    )

    for name in ${packages[@]}
    do
        yay -S $name --noconfirm
    done
}

function installYay() {
    if command -v git;
    then
        sudo pacman -S git --noconfirm
        cd /tmp
        git clone https://aur.archlinux.org/yay-bin
        cd yay-bin
        makepkg -si
    fi
}

command -v yay || installYay
packageInstall
setup

# for powerlevel10k
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
