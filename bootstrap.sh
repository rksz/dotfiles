#!/bin/bash

BASEPATH=$(cd `dirname $0`; pwd)
cd $BASEPATH
echo $BASEPATH
# ln -s $HOME/dotfiles/.dir_colors        $HOME/
# ln -s $HOME/dotfiles/.taskrc            $HOME/
# ln -s $HOME/dotfiles/.tmux.conf.local   $HOME/
# ln -s $HOME/dotfiles/.vimrc             $HOME/
# ln -s $HOME/dotfiles/.zshrc.alias       $HOME/
# ln -s $HOME/dotfiles/.zshrc.alias.local $HOME/
# ln -s $HOME/dotfiles/.vim               $HOME/
ln -s $HOME/dotfiles/.config            $HOME/
ln -s $HOME/dotfiles/.ctags             $HOME/
ln -s $HOME/dotfiles/.gitignore         $HOME/
ln -s $HOME/dotfiles/.gitconfig         $HOME/
ln -s $HOME/dotfiles/.gvimrc            $HOME/
ln -s $HOME/dotfiles/.peco              $HOME/
ln -s $HOME/dotfiles/.tmux.conf         $HOME/
ln -s $HOME/dotfiles/.zsh               $HOME/
ln -s $HOME/dotfiles/.zshrc             $HOME/
ln -s $HOME/dotfiles/Vagrantfile        $HOME/

case "${OSTYPE}" in
darwin*)
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/fonts
    brew tap neovim/homebrew-neovim
    brew install --disable-etcdir zsh       || true
    brew install ack                        || true
    brew install ansible                    || true
    brew install autojump                   || true
    brew install binutils                   || true
    brew install caskroom/cask/brew-cask    || true
    brew install cocot                      || true
    brew install coreutils                  || true
    brew install ctags                      || true
    brew install curl                       || true
    brew install findutils                  || true
    brew install git                        || true
    brew install go                         || true
    brew install htop                       || true
    brew install hub                        || true
    brew install mcrypt                     || true
    brew install nkf                        || true
    brew install openssl                    || true
    brew install rbenv                      || true
    brew install reattach-to-user-namespace || true
    brew install tig                        || true
    brew install tmux                       || true
    brew install tree                       || true
    brew install vim                        || true
    brew install watch                      || true
    brew install wget                       || true
    brew install xz                         || true
    brew install zsh                        || true
    brew install ag                         || true
    brew install peco                       || true
    brew install neovim                     || true
    #echo export "PATH=\$(brew --prefix php55)/bin:\$PATH" >> ~/.profile
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    brew cask install 1password
    brew cask install alfred                || true
    brew cask install dropbox
    #brew cask install eclipse-ide           || true
    #brew cask install evernote              || true
    #brew cask install filezilla             || true
    #brew cask install firefox               || true
    brew cask install github
    brew cask install google-chrome         || true
    brew cask install google-drive          || true
    brew cask install google-japanese-ime   || true
    brew cask install hoster                || true
    brew cask install hyperswitch           || true
    brew cask install iterm2                || true
    brew cask install karabiner             || true
    brew cask install licecap               || true
    brew cask install mysqlworkbench        || true
    brew cask install quartzclocks          || true
    brew cask install skype                 || true
    brew cask install sourcetree            || true
    brew cask install spectacle             || true
    brew cask install the-unarchiver        || true
    brew cask install vagrant               || true
    brew cask install virtualbox            || true
    brew cask install showyedge               || true
    brew cask install xmind                   || true
    #brew cask install amethyst
    brew cask install font-fontawesome        || true
    brew cask install font-lobster            || true
    brew cask install font-noto-sans-japanese || true
    brew cask install font-anonymous-pro      || true
    brew cask install font-ricty-diminished   || true
    brew cask install atom   || true

    # cleanup
    brew update                             || true
    brew cleanup

    # nodebrew
    curl -L git.io/nodebrew | perl - setup
    echo export PATH=\$HOME/.nodebrew/current/bin:\$PATH >> ~/.profile
    source ~/.profile
    nodebrew install latest
    nodebrew install stable
    nodebrew use latest
    # # tools via npm
    # npm install -g bower
    # #npm install -g coffee-script
    # npm install -g gulp
    # npm install -g gulp-straw
    # npm install -g istanbul
    # npm install -g david
    # npm install -g node-inspector
    # npm install -g superstatic
    go get github.com/motemen/ghq

    ##SDKMAN
    ## curl -s api.sdkman.io | bash
;;

linux*)
    echo "nothingtest"
;;
esac

# pip3 install neovim
#
# brew cask list
# alfred               brackets             evernote             github-desktop       hoster               licecap              mysqlworkbench       showyedge            sourcetree           vagrant-manager
# amethyst             colors               filezilla            google-chrome        hosts                onyx                 skitch               spectacle
# android-studio       dash                 firefox              google-drive         iterm2               menubarfilter        pencil               skype                sublime-text         virtualbox
# atom                 dockertoolbox        flashlight           google-japanese-ime  java                 poedit               slack                the-unarchiver       xmind
# bitcoin-core         eclipse-java         fluid                hipchat              karabiner            prepros              vagrant
#


# brew list
# ack       bdw-gc       brew-file  curl            fig          gettext          hub       libpng    mobile-shell  node       php-code-sniffer  rbenv                       task                   unixodbc  xz
# ansible   binutils     cmake      dnsmasq         findutils    gmp              hugo      libtasn1  mysql         oniguruma  php56             readline                    the_silver_searcher    vim       zlib
# ant       bison        cocot      docker          freetype     gnutls           icu4c     libtool   neovim        openssl    phpmd             reattach-to-user-namespace  tig                    vit       zsh
# autoconf  boost        composer   docker-compose  fuse4x       go               jpeg      libxml2   nettle        parallel   pkg-config        sl                          tmux                   w3m
# autojump  boot2docker  coreutils  docker-machine  fuse4x-kext  heroku-toolbelt  jq        libyaml   nkf           pcre       protobuf          sqlite                      tmuxinator-completion  watch
# automake  brew-cask    ctags      euler-py        gdbm         htop-osx         libevent  lynx      nmap          peco       python3           subversion                  tree                   wget
