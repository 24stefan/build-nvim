#!/bin/bash
set -e




sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install -y neovim git ripgrep unzip

echo " Installed Neovim: $(nvim --version | head -n1)"



if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
fi


git clone https://github.com/LazyVim/starter ~/.config/nvim
cd ~/.config/nvim
rm -rf .git

echo " Installing plugins..."
nvim --headless "+Lazy! sync" +qa

echo " Done. Finally! 
