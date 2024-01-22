#!/usr/bin/env bash

# GUI applications

set -xe

sudo apt update
sudo apt upgrade -y

STOW_DIR="../stow_dot_files"

# TODO: Make sure cargo is installed.

# Needed for alacritty build.
sudo apt install -y cmake libfontconfig1-dev



cargo install alacritty
# make alacritty the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.cargo/bin/alacritty 110

# download fonts and move to ~/.local/share/fonts if not already there
if [ ! -d ~/.local/share/fonts/mesloLGS_NF ]; then
  mkdir -p ~/.local/share/fonts/mesloLGS_NF
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O ~/.local/share/fonts/mesloLGS_NF/MesloLGS\ NF\ Regular.ttf
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O ~/.local/share/fonts/mesloLGS_NF/MesloLGS\ NF\ Bold.ttf
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O ~/.local/share/fonts/mesloLGS_NF/MesloLGS\ NF\ Italic.ttf
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O ~/.local/share/fonts/mesloLGS_NF/MesloLGS\ NF\ Bold\ Italic.ttf
fi

# install fonts
fc-cache -f -v

# stow alacritty
cp -r ~/.config/alacritty ~/.config/alacritty_backup
stow -d $STOW_DIR -t ~/ alacritty 

# flatpaks (works with pop-shop)
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub org.kicad.KiCad




# gui
sudo apt install -y \
#   meld \
#   peek \
#   redshift \
#   xcape \
  xclip # TODO weplace with wayland equivalent when I switch to wayland.

# Cannot merge into single line
# sudo snap install drawio --classic
# sudo snap install emacs --classic


# stow alacritty
# stow code

# Working alt-shift-tab
# gsettings reset org.gnome.desktop.input-sources xkb-options

# Improve double-click word selection
# https://unix.stackexchange.com/questions/290544/double-click-selection-in-gnome-terminal
# puuid=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
# gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$puuid/ word-char-exceptions '@ms "-=&#:/.?@+~_%;"'
