#!/usr/bin/env bash -e

setup() {
	ORIGINAL_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
	rm "$ORIGINAL_SETTINGS"
	ln -s $DOTFILES/vscode/settings.json "$ORIGINAL_SETTINGS"
}

setup
