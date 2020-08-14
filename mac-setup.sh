#!/usr/bin/env bash

# Install XCode tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cat brew_list | grep -v ^# | xargs brew install
cat brew_tap | grep -v ^# | xargs brew tap
brew update && brew outdated
brew upgrade && brew cleanup
cat brew_cask_list | grep -v ^# | xargs brew cask install
brew cask outdated --quiet | xargs brew cask reinstall

# Setup Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dotfiles
ls -p | grep -v / | grep dot- | cut -d '-' -f 2 | xargs -n 1 -I {} ln -s -f `pwd`/dot-{} ~/.{}
ls -p | grep / | grep dot- | cut -d '-' -f 2 | cut -d '/' -f 1 | xargs -n 1 -I {} sh -c '[ ! -e ~/.{} ] && ln -s -f `pwd`/dot-{} ~/.{}'

git submodule init
git submodule update
ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf

# Setup git
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global core.excludesfile ~/.gitignore_global

# Install fzf
yes | /usr/local/opt/fzf/install

# Install i2cssh
gem install i2cssh

pyenv install 2.7.18
pyenv install 3.6.11
pyenv install 3.7.8
