#!/bin/bash
#
# Auto setup tools @rskz
#
#########################################

DOT_FILES=(
.zsh
.zshrc
.zshrc.alias
.ctags
.gitignore
.vimrc
.tmux.conf
.dir_colors
.vim
.gvimrc
.taskrc
)

LOCAL_FILES=(
.zshrc.alias.local
.tmux.conf.local
)

main() {
    ## 1. Create symbolic links
    for i in ${DOT_FILES[@]}
    do
        ln -s $HOME/dotfiles/$i $HOME/$i
    done
    echo "[setup notice] If you don't use zshell as login shell, run following command."
    echo "- sudo cp -a $HOME/dotfiles/bin/git_diff_wrapper /usr/local/bin/"

    ## 2. Create local configure files
    for i in ${LOCAL_FILES[@]}
    do
        touch $HOME/$i
    done

    ## 3. Load submodules
    git submodule update --init
    git submodule foreach git checkout master

    ## 4. Install vim plugins
    vim -N -u $HOME/.vimrc -c "try | NeoBundleUpdate $* | finally | qall! | endtry" -U NONE -i NONE -V1 -e -s
}

main "$@"
