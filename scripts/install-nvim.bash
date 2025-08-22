#!/bin/bash 

echo "Starting downloading nightly..."
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
echo "Download successful."
echo "Extracting..."
tar xzvf nvim-linux-x86_64.tar.gz
rm -rf ~/Applications/nvim-linux-x86_64
mv nvim-linux-x86_64 ~/Applications/
rm -rf nvim-linux-x86_64
echo "Done"
#wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
