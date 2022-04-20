#!/bin/zsh
#
# Install Homebrew if not already installed
#

# Check for Homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # need to add homebrew to the PATH: export PATH='/opt/homebrew/bin:$PATH'
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed"
fi

exit 0