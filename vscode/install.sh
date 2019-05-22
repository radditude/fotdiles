#!/usr/bin/env bash

DOTFILES_ROOT=$(pwd -P)

setup() {
	ln -s $DOTFILES_ROOT/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
}

setup
