#!/bin/bash
#
# Auto setup tools @rskz
#
#########################################


## 1. Create symbolic links
DOT_FILES=( .zsh .zshrc .zshrc.alias .ctags .gitconfig .gitignore .vimrc .vrapperrc .tmux.conf .dir_colors .vim )
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

## 2. Create local configure files
LOCAL_FILES=( .zshrc.alias.local .tmux.conf.local )
for file in ${LOCAL_FILES[@]}
do
    touch $HOME/$file
done


## 3. Load submodules
git submodule update --init


## 4. Install vim plugins
vim +NeoBundleInstall


## 5. Install git diff with vimdiff
cat <<EOC >>$HOME/dotfiles/.gitconfig
[user]
  name = Ricky
  email = mail@example.com
[diff]
  external = git_diff_wrapper
[pager]
  diff =
EOC

## 6. Finished messages
echo "Setup finished! Please check following packages."
echo "--> zsh tmux ncurses-term git tree ack lynx watch dstat"
