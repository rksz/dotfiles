#!/bin/bash
#
# auto setup tools @rskz
#
#########################################


## create symbolic links
DOT_FILES=( .zsh .zshrc .zshrc.alias .ctags .gitconfig .gitignore .vimrc .vrapperrc .tmux.conf .dir_colors .vim )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


## Import submodule
git submodule update --init


## Install vim plugins
vim +NeoBundleInstall


## Install git diff with vimdiff
cat <<EOC >>$HOME/dotfiles/.gitconfig
[diff]
  external = git_diff_wrapper
[pager]
  diff =
EOC


## finished!
echo "finished!"
