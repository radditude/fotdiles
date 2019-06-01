#!/usr/bin/env bash

# finder should show hidden files by default
defaults write com.apple.finder AppleShowAllFiles YES
# Specify iterm preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
