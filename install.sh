#!/bin/zsh

red=$'\e[1;31m'
green=$'\e[1;32m'
white=$'\e[0m'
reset=$'\e[0m'

# Run the Scripts
./install-homebrew.sh
./brew.sh
./brew-cask.sh
./symlink-setup.sh

# Install oh-my-zsh if not installed
# https://ohmyz.sh/
if [ -d ~/.oh-my-zsh ]; then
  echo "oh-my-zsh is installed"
 else
  echo "oh-my-zsh will be installed"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-syntax-highlighting plugin
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting' and 'zsh-autosuggestions'"
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
  echo $red "-----> Check, add/update plugins=(zsh-autosuggestions zsh-syntax-highlighting) in your .zshrc file"
fi
cd "$CURRENT_DIR"

# Refresh the current terminal with the newly installed configuration
exec zsh

echo $green "👌 Finish!"
