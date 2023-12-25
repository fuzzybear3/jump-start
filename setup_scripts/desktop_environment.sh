#!/usr/bin/env bash

# GUI applications

set -xe

sudo apt update
sudo apt upgrade

# TODO: Make sure cargo is installed.

# Needed for alacritty build.
sudo apt install -y cmake libfontconfig1-dev

cargo install alacritty
# make alacritty the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.cargo/bin/alacritty 110



# flatpaks (works with pop-shop)
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub org.kicad.KiCad


# gui
# sudo apt install -y \
#   meld \
#   peek \
#   redshift \
#   xcape \
#   xclip

# Cannot merge into single line
# sudo snap install drawio --classic
# sudo snap install emacs --classic
# sudo snap install slack --classic


# stow alacritty
# stow code

# Working alt-shift-tab
# gsettings reset org.gnome.desktop.input-sources xkb-options

# Improve double-click word selection
# https://unix.stackexchange.com/questions/290544/double-click-selection-in-gnome-terminal
# puuid=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
# gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$puuid/ word-char-exceptions '@ms "-=&#:/.?@+~_%;"'
