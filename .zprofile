
[[ -f ~/.zshrc ]] && . ~/.zshrc

export PATH="/home/sahil/repos/config/bin:$PATH"
export EDITOR=nvim
export GTK_THEME=Adwaita:dark

XDG_DESKTOP_DIR="$HOME/documents"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_DOWNLOAD_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/documents"
XDG_PICTURES_DIR="$HOME/documents"
XDG_PUBLICSHARE_DIR="$HOME/documents"
XDG_TEMPLATES_DIR="$HOME/documents"
XDG_VIDEOS_DIR="$HOME/documents"


if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi

