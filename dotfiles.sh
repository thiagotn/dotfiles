#!/bin/bash

echo "Setup dotfiles..."
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.config/nvim ~/.config/nvim
