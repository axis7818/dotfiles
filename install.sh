#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
echo "linking gitconfig..."
ln -sf ${BASEDIR}/git/gitconfig ~/.gitconfig

# tmux
echo "linking tmux config..."
ln -sf ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf

# nvim (make sure neovim is installed)
echo "linking neovim config..."
mkdir -p ~/.config/nvim
ln -sf ${BASEDIR}/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${BASEDIR}/nvim/colors/onedark.vim ~/.config/nvim/colors/onedark.vim
ln -sf ${BASEDIR}/nvim/autoload/onedark.vim ~/.config/nvim/autoload/onedark.vim
