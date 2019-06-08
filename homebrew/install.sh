#!/usr/bin/env bash -e

cd "$DOTFILES/homebrew"

brew update
brew upgrade
brew bundle
# in case we've installed anything new lately
rm Brewfile
brew bundle dump
