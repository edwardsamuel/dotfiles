#!/usr/bin/env bash

# Install XCode tools
xcode-select --install

# Install Homebrew 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew outdated
brew upgrade && brew cleanup
cat brew_list | xargs brew install
cat brew_tap | xargs brew tap
cat brew_cask_list | xargs brew cask install
