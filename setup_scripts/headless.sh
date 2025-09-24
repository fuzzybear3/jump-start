#/usr/bin/env bash

# Core tools for working with the system

STOW_DIR="../stow_dot_files"

set -xe

sudo apt update

sudo apt install -y \
  stow \
  tmux \
  zsh \
  tree \
  python3-pip \
  python-is-python3 \
  python3-venv

stow -d $STOW_DIR -t ~/ git

# Check if cargo (Rust package manager) is installed
if command -v cargo > /dev/null 2>&1; then
    echo "Rust is already installed."
else
    echo "Installing rust."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


stow -d $STOW_DIR -t ~/ p10k


#source
. "$HOME/.cargo/env"


rustup component add rust-analyzer

# rust programs
cargo install bat
cargo install difftastic
cargo install watchexec-cli
cargo install bottom


# stow git

mv ~/.zshrc ~/.zshrc.backup
stow -d $STOW_DIR -t ~/ zsh

# install node js (needed for copilot)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# reset shell
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
# source ~/.bashrc


nvm install node

# stow tmux
# ./get-tmux-rst.sh

# Some plugins (CPU monitor) require cmake, which is installed in setup/apps.sh
# But tmux will still work fine without it.
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins ~/.tmux/plugins/tpm/bin/install_plugins
# need to run this within tmux
# ~/.tmux/plugins/tpm/bin/install_plugins

# Use our linked .zshrc, rather than the one provided by oh-my-zsh
# stow -d $STOW_DIR zsh

# pip install codespell

# fzf
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

sudo chsh -s $(which zsh) $USER


# docker
 curl -fsSL https://get.docker.com -o get-docker.sh

 sudo sh ./get-docker.sh

 sudo usermod -aG docker $USER

# git lfs
(. /etc/lsb-release &&
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |
sudo env os=ubuntu dist="${DISTRIB_CODENAME}" bash)
sudo apt-get install git-lfs

echo "Script finished."
