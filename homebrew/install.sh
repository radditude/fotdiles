#!/usr/bin/env bash -e

cd "$DOTFILES/homebrew"


brew update
brew upgrade
brew upgrade --cask
brew bundle install --no-lock
# overwrite existing Brewfile, in case we've installed anything new
brew bundle dump --force
