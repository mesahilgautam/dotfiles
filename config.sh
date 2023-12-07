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
    mkdir -p ~/.cache/zsh
    touch ~/.cache/zsh/history

	sudo ln -s ~/repos/config/nvim ~/.config/nvim
	sudo ln -s ~/repos/config/dunst ~/.config/dunst
	sudo ln -s ~/repos/config/gtk-3.0 ~/.config/gtk-3.0
	sudo ln -s ~/repos/config/mpv ~/.config/mpv
	sudo ln -s ~/repos/config/newsboat ~/.config/newsboat
	sudo ln -s ~/repos/config/tmux ~/.config/tmux
	sudo ln -s ~/repos/config/wal.config ~/.config/wal
	sudo ln -s ~/repos/config/wal.cache ~/.cache/wal

	sudo ln -s ~/repos/config/yt-dlp ~/.config/yt-dlp
	sudo ln -s ~/repos/config/fonts /usr/share/fonts/f

	sudo ln -s ~/repos/config/.xinitrc ~/.xinitrc
	sudo ln -s ~/repos/config/.zshrc ~/.zshrc
	sudo ln -s ~/repos/config/.zprofile ~/.zprofile


    export PATH="/home/$USER/repos/config/bin:$PATH"

    # add user to docker group
    sudo usermod -aG docker $USER
    # qemukvm
    #
    sudo usermod -aG video $USER
    ~/repos/config/bin/buildsuckless
    reboot

    # touchpad settings
# Section "InputClass"
#         Identifier "libinput touchpad catchall"
#         MatchIsTouchpad "on"
#         MatchDevicePath "/dev/input/event*"
#         Option "Tapping" "on"
#         Option "ScrollMethod" "twofinger"
#         Option "HorizontalScrolling" "on"
#         Option "DisableWhileTyping" "on"
#         Driver "libinput"
# EndSection

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
        "cmake"
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
        "man"
        "wireless_tools" # for wifi name
        "visual-studio-code-bin"
        "firefox" # for other email
        "feh"
        "sxiv"
        "pavucontrol"
        "neomutt"
        "wal" # pywal
        "mpv"
        "lua"
        "gcc"
        "g++"
        "make"
        "fzf"
        "pyenv" # to manage different python versions
        "lazygit" # a minimal terminal based git client(ish) [maybe]
        # "sxhkd"     # to setup keybindings beyond default dwm keybindings
        "hugo"
        # ""
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

# to change from http to ssh
#https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh

# ~
# ├── Downloads         # all downloads or extra files, which are not either media/something i would want long term
# └── repos
#     ├── config        # this repo
#     ├── files         # private git repo
#     ├── libreoffice   # fresh build
#     └── media         # will be backed up to hhd, and will be copied from there only

