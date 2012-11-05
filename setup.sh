#!/bin/bash

DOT_FILES=( .zsh .zshrc .zshrc.alias .ctags .gitconfig .gitignore .vimrc .vrapperrc .tmux.conf .dir_colors .vim )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


git submodule update --init


# final step:
# vim login -> :BundleInstall
