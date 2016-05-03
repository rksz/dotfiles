#!/bin/bash
BASEPATH=$(cd `dirname $0`; pwd)
cd $BASEPATH
echo $BASEPATH
# ln -s $HOME/dotfiles/.vimrc             $HOME/
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

# ------------------------------
## Homebrew
# ------------------------------
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/fonts
brew tap neovim/homebrew-neovim
brew install --disable-etcdir zsh         || true
brew install ack                          || true
brew install ansible                      || true
brew install autojump                     || true
brew install binutils                     || true
brew install caskroom/cask/brew-cask      || true
brew install cocot                        || true
brew install coreutils                    || true
brew install ctags                        || true
brew install curl                         || true
brew install findutils                    || true
brew install git                          || true
brew install go                           || true
brew install hugo                         || true
brew install htop                         || true
brew install hub                          || true
brew install mcrypt                       || true
brew install nkf                          || true
brew install openssl                      || true
brew install rbenv                        || true
brew install reattach-to-user-namespace   || true
brew install tig                          || true
brew install tmux                         || true
brew install tree                         || true
brew install vim                          || true
brew install watch                        || true
brew install wget                         || true
brew install xz                           || true
brew install zsh                          || true
brew install ag                           || true
brew install peco                         || true
brew install python3                      || true
brew install neovim                       || true
brew install jq                           || true
brew cask install alfred                  || true
brew cask install dropbox                 || true
brew cask install github                  || true
brew cask install google-chrome           || true
brew cask install google-drive            || true
brew cask install google-japanese-ime     || true
brew cask install hoster                  || true
brew cask install hyperswitch             || true
brew cask install iterm2                  || true
brew cask install karabiner               || true
brew cask install licecap                 || true
brew cask install mysqlworkbench          || true
brew cask install quartzclocks            || true
brew cask install skype                   || true
brew cask install sourcetree              || true
brew cask install spectacle               || true
brew cask install the-unarchiver          || true
brew cask install vagrant                 || true
brew cask install virtualbox              || true
brew cask install showyedge               || true
brew cask install xmind                   || true
brew cask install font-fontawesome        || true
brew cask install font-lobster            || true
brew cask install font-noto-sans-japanese || true
brew cask install font-anonymous-pro      || true
brew cask install font-ricty-diminished   || true
brew cask install atom                    || true
brew cask install dockertoolbox           || true
brew update                               || true
brew cleanup                              || true

# ------------------------------
# MacApp
# ------------------------------
# macapp install Evernote
# macapp install Reeder3
# macapp install Pixelmeter
# macapp install Pomodoro Time
# macapp install Kindle
# macapp install ScanSnap Manager
# macapp install ScanSnap Cloud
# macapp install GooglePlayMusic
# macapp install Franz
# macapp install Symantec Endpoint Protection
# macapp install line

# ------------------------------
# Node
# ------------------------------
curl -L git.io/nodebrew | perl - setup
nodebrew install latest
nodebrew install stable
nodebrew use latest
npm install -g bower
npm install -g gulp
npm install -g gulp-straw
npm install -g gulp-sass
npm install -g node-sass
npm install -g node-inspector
npm install -g superstatic

# ------------------------------
# Go & Gem & Python
# ------------------------------
pip3 install neovim
go get github.com/motemen/ghq
gem install tmuxinator

# ------------------------------
##SDKMAN
# ------------------------------
## curl -s api.sdkman.io | bash
