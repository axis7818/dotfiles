#!/usr/bin/env bash

echo "Installing dotfiles. If a file exists, it will not be overridden"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git
echo "linking gitconfig..."
ln -s ${BASEDIR}/git/gitconfig ~/.gitconfig

# tmux
echo "linking tmux config..."
ln -s ${BASEDIR}/tmux/tmux.conf ~/.tmux.conf

# nvim (make sure neovim is installed)
echo "linking neovim config..."
mkdir -p ~/.config/nvim
ln -s ${BASEDIR}/nvim/init.vim ~/.config/nvim/init.vim
ln -s ${BASEDIR}/nvim/colors/onedark.vim ~/.config/nvim/colors/onedark.vim
ln -s ${BASEDIR}/nvim/autoload/onedark.vim ~/.config/nvim/autoload/onedark.vim
ln -s ${BASEDIR}/nvim/colors/one.vim ~/.config/nvim/colors/one.vim

# zsh
echo "linking zsh config..."
ln -s ${BASEDIR}/zsh/zshrc ~/.zshrc
ln -s ${BASEDIR}/zsh/custom/themes/axis7818.zsh-theme ~/.oh-my-zsh/custom/themes/axis7818.zsh-theme

# virtualenvs
echo "linking virtualenv scripts"
ln -s ${BASEDIR}/virtualenvs/postactivate ~/.virtualenvs/postactivate
ln -s ${BASEDIR}/virtualenvs/postdeactivate ~/.virtualenvs/postdeactivate
