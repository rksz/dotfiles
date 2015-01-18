#!/usr/bin/env sh

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew tap homebrew/php
brew tap caskroom/fonts

# nodebrew
curl -L git.io/nodebrew | perl - setup
echo export PATH=\$HOME/.nodebrew/current/bin:\$PATH >> ~/.profile
source ~/.profile
nodebrew install latest
nodebrew install stable
nodebrew use latest

# tools via brew
brew install --disable-etcdir zsh       || true
brew install ack                        || true
brew install android-sdk                || true
brew install ansible
brew install autojump                   || true
brew install binutils                   || true
brew install caskroom/cask/brew-cask
brew install cocot                      || true
brew install coreutils                  || true
brew install ctags                      || true
brew install curl                       || true
brew install findutils                  || true
brew install git
brew install go                         || true
brew install htop                       || true
brew install hub                        || true
brew install lynx                       || true
brew install mcrypt
brew install nkf                        || true
brew install openssl                    || true
brew install rbenv                      || true
brew install reattach-to-user-namespace || true
brew install taskwarrior                || true
brew install tig                        || true
brew install tmux                       || true
brew install tree                       || true
brew install vim                        || true
brew install vit                        || true
brew install watch                      || true
brew install wget                       || true
brew install xz                         || true
brew install zsh                        || true
echo export "PATH=\$(brew --prefix php55)/bin:\$PATH" >> ~/.profile

# tools via npm
npm install -g bower
#npm install -g coffee-script
npm install -g gulp
npm install -g gulp-straw
npm install -g istanbul
npm install -g david
npm install -g node-inspector
npm install -g superstatic

# desktop apps via cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew cask install 0xed
brew cask install 1password
brew cask install alfred                || true
brew cask install bettertouchtool       || true
brew cask install brackets
brew cask install chocolat
brew cask install colors                || true
brew cask install dash                  || true
brew cask install dropbox
brew cask install eclipse-ide           || true
brew cask install evernote              || true
brew cask install filezilla             || true
brew cask install firefox
brew cask install firefox               || true
brew cask install github
brew cask install google-chrome         || true
brew cask install google-drive          || true
brew cask install google-japanese-ime   || true
brew cask install hipchat               || true
brew cask install hoster                || true
brew cask install hyperswitch           || true
brew cask install iterm2                || true
brew cask install karabiner             || true
brew cask install licecap               || true
brew cask install marked
brew cask install mi                    || true
brew cask install mou                   || true
brew cask install mysqlworkbench        || true
brew cask install pandoc
brew cask install quartzclocks          || true
brew cask install querious
brew cask install skype                 || true
brew cask install sourcetree            || true
brew cask install spectacle             || true
brew cask install the-unarchiver        || true
brew cask install vagrant               || true
brew cask install vagrant-manager
brew cask install virtualbox            || true
brew cask install vlc

# fonts via caskroom-fonts
brew cask install font-fontawesome
brew cask install font-lobster
brew cask install font-noto-sans-japanese

# cleanup
brew update                             || true
brew cleanup

# vagrant
vagrant plugin install vagrant-login
vagrant plugin install vagrant-global-status
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-cachier
vagrant plugin install sahara
vagrant plugin install vagrant-vbox-snapshot
vagrant plugin install vagrant-omnibus
