#!/bin/bash

## 1. Create symlinks
ls -s $HOME/dotfiles/.zsh               $HOME/
ls -s $HOME/dotfiles/.zshrc             $HOME/
ls -s $HOME/dotfiles/.zshrc.alias       $HOME/
ls -s $HOME/dotfiles/.ctags             $HOME/
ls -s $HOME/dotfiles/.gitignore         $HOME/
ls -s $HOME/dotfiles/.vimrc             $HOME/
ls -s $HOME/dotfiles/.tmux.conf         $HOME/
ls -s $HOME/dotfiles/.dir_colors        $HOME/
ls -s $HOME/dotfiles/.vim               $HOME/
ls -s $HOME/dotfiles/.gvimrc            $HOME/
ls -s $HOME/dotfiles/.taskrc            $HOME/
ls -s $HOME/dotfiles/.zshrc.alias.local $HOME/
ls -s $HOME/dotfiles/.tmux.conf.local   $HOME/

## 2. Update git
git submodule update --init
git submodule foreach git checkout master

## 3. Install vim plugins
vim -N -u $HOME/.vimrc -c "try | NeoBundleUpdate $* | finally | qall! | endtry" -U NONE -i NONE -V1 -e -s
