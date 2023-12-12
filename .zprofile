
[[ -f ~/.zshrc ]] && . ~/.zshrc

export PATH="/home/sahil/repos/config/bin:$PATH"
export EDITOR=nvim
export GTK_THEME=Adwaita:dark
export GPG_AGENT_INFO="$(gpgconf --list-dirs agent-socket)/S.gpg-agent:0:1"

# is redundent at this point, must check
XDG_DESKTOP_DIR="$HOME/documents"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_DOWNLOAD_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/documents"
XDG_PICTURES_DIR="$HOME/documents"
XDG_PUBLICSHARE_DIR="$HOME/documents"
XDG_TEMPLATES_DIR="$HOME/documents"
XDG_VIDEOS_DIR="$HOME/documents"

# pyenv (if in .zshrc, makes it slow)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi


