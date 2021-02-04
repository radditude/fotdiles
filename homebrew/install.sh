#!/usr/bin/env bash -e

cd "$DOTFILES/homebrew"

brew update
brew upgrade
brew upgrade --cask
rm Brewfile
brew bundle --no-lock
# in case we've installed anything new lately
brew cleanup
