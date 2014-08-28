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

    #Definition
    readonly BASEPATH=$(cd `dirname $0`; pwd)
    readonly CMDNAME=$(basename $0)

    cd $BASEPATH

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
    vim -N -u $HOME/.vimrc -c "try | NeoBundleUpdate $* | finally | qall! | endtry" \
        -U NONE -i NONE -V1 -e -s
    echo ''

    ## 5. Specific settings
    case "${OSTYPE}" in

        # Mac(Unix)
        darwin*)
            brew bundle
            #for sshfs
            sudo /bin/cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
            sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x
        ;;
        # Linux
        linux*)
            rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
        ;;

    esac

    echo "============================================================"
    echo "------------------ SETUP WAS COMPLETED! --------------------"
    echo "============================================================"

}

main "$@"
