#!/bin/bash

warnnvim() {
  echo "Please install neovim"
  exit
}

warnnode() {
  echo "Please install node"
  exit
}

warngit() {
  echo "Please install git"
  exit
}

changedirname() {
  mv $HOME/.config/nvim $HOME/.config/oldneovim
  echo "Your existing nvim config has been changed to oldneovim"
  clonerepo
}

clonerepo() {
  echo "Cloning repo..."
  git clone https://github.com/hackorum/VapourNvim ~/.config/nvim
  nvim +PackerSync
}

which nvim >/dev/null && echo "Neovim is installed" || warnnvim
which node >/dev/null && echo "Node is installed" || warnnode
which git >/dev/null && echo "Git is installed" || warngit

[ -d "$HOME/.config/nvim" ] && changedirname || clonerepo

