#!/usr/bin/env bash

source $DOTFILES/functions/log

settings() {
	ORIGINAL_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
	rm "$ORIGINAL_SETTINGS"
	ln -s $DOTFILES/vscode/settings.json "$ORIGINAL_SETTINGS"
}

extensions() {
	file="$DOTFILES/vscode/extensions"

	for ex in $(cat $file); do
		info "installing https://marketplace.visualstudio.com/items?itemName=$ex"
		code --install-extension $ex
	done

	code --list-extensions >$file
}

main() {
	info "syncing VS Code settings"
	settings
	info "installing VS Code extensions"
	extensions
	success "done with VS Code setup!"
}

main
