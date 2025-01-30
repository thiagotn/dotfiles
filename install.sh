#!/bin/bash

set -e

echo "Setup dependencies..."

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing dependencies for MacOS..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo >> /Users/tnogueira/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tnogueira/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew bundle --file Brewfile

    echo "Setup nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

    echo "Setup sdkman..."
    curl -s "https://get.sdkman.io" | bash

    echo "Setup dotfiles..."
    ./dotfiles.sh

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Installing dependencies for Linux..."

    echo "TODO..."
else
    echo "Unsupported OS"
    exit 1
fi
