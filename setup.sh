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
)

LOCAL_FILES=(
.zshrc.alias.local
.tmux.conf.local
)

BREW_PLUGINS=(
zsh
vim
tmux
tig
reattach-to-user-namespace
autojump
fuse4x
sshfs
htop
ack
ctags
git-flow
tree
watch
wget
curl
mosh
nkf
openssl
lynx
xz
binutils
coreutils
findutils
sl
)

YUM_PLUGINS=(
tmux
zsh
tig
tree
fuse-sshfs
htop
ack
dstat
mosh
)


main() {

    #Definition
    readonly BASEPATH=$(cd `dirname $0`; pwd)
    readonly CMDNAME=$(basename $0)

    ## 1. Create symbolic links
    for file in ${DOT_FILES[@]}
    do
        ln -s $HOME/dotfiles/$file $HOME/$file
    done
    echo "[setup notice] If you don't use zshell as login shell, run following command."
    echo "- sudo cp -a $HOME/dotfiles/bin/git_diff_wrapper /usr/local/bin/"

    ## 2. Create local configure files
    for file in ${LOCAL_FILES[@]}
    do
        touch $HOME/$file
    done

    ## 3. Load submodules
    git submodule update --init

    ## 4. Install vim plugins
    vim +NeoBundleInstall! 2>/dev/null

    ## 5. Specific settings
    case "${OSTYPE}" in

        # Mac(Unix)
        darwin*)
            brew install ${BREW_PLUGINS[@]}
            brew update

            #for sshfs
            sudo /bin/cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
            sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x

            echo "[setup notice] DOWNLOAD FOLLOWING APPLICATIONS MANUALLY"
            echo "- MacVim: https://code.google.com/p/macvim-kaoriya/downloads/list"
            echo "- Vagrant: http://downloads.vagrantup.com/"
            echo "- VirtualBox: https://www.virtualbox.org/wiki/Downloads"
        ;;
        # Linux
        linux*)
            rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
            yum -y install ${YUM_PLUGINS[@]}
        ;;

    esac

    echo "============================================================"
    echo "------------------ SETUP WAS COMPLETED! --------------------"
    echo "============================================================"

}

main "$@"
