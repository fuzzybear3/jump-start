#!/usr/bin/env bash

# Core tools for working with the system

STOW_DIR="../stow_dot_files"

set -xe

sudo apt update

# sudo apt install -y bat

# Check if cargo (Rust package manager) is installed
if command -v cargo > /dev/null 2>&1; then
    echo "Rust is already installed."
else
    echo "Installing rust."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# rust programs
cargo install bat
cargo install difftastic

sudo apt install -y \
  stow \
  tmux \
  zsh

# stow git 

# stow tmux
# ./get-tmux-rst.sh

# Some plugins (CPU monitor) require cmake, which is installed in setup/apps.sh
# But tmux will still work fine without it.
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins ~/.tmux/plugins/tpm/bin/install_plugins
# need to run this within tmux
# ~/.tmux/plugins/tpm/bin/install_plugins

# Use our linked .zshrc, rather than the one provied by oh-my-zsh
# stow -d $STOW_DIR zsh

# zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# stow p10k

# fzf
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

user=$(whoami)
sudo chsh -s $(which zsh) $user

echo "Scripted finished."