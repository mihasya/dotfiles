#!/usr/bin/env bash

set -e

echo "Initializing Vim"

if [ -d ./bundle/vundle ]; then
    echo "Vundle already installed"
else
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/vundle
fi

mkdir -p ~/.vimundo