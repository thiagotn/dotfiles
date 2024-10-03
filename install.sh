#!/bin/bash

set -e

echo "Setup dotfiles..."

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing dependencies for MacOS..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle --file Brewfile

    echo "Setup nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

    echo "Setup sdkman..."
    curl -s "https://get.sdkman.io" | bash

    echo "Setup dotfiles..."
    ln -s $(pwd)/.zshrc ~/.zshrc
    ln -s $(pwd)/.gitconfig ~/.gitconfig
    ln -s $(pwd)/.config/nvim ~/.config/nvim

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Installing dependencies for Linux..."

    echo "TODO..."
else
    echo "Unsupported OS"
    exit 1
fi
