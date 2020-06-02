#!/usr/bin/env bash -e

cd "$DOTFILES/homebrew"

brew update
brew upgrade
brew bundle --no-lock
# in case we've installed anything new lately
rm Brewfile
brew bundle dump
