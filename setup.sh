#!/bin/bash
#
# auto setup tools
#
#########################################


#========================================
# create symbolic links
#========================================
DOT_FILES=( .zsh .zshrc .zshrc.alias .ctags .gitconfig .gitignore .vimrc .vrapperrc .tmux.conf .dir_colors .vim )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


#========================================
# Import submodule
#========================================
git submodule update --init



#========================================
# Install vim plugins
#========================================
vim +NeoBundleInstall +qall


