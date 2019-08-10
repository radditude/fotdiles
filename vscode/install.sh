#!/usr/bin/env bash

source $DOTFILES/functions/log

settings() {
	ORIGINAL_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
	rm "$ORIGINAL_SETTINGS"
	ln -s $DOTFILES/vscode/settings.json "$ORIGINAL_SETTINGS"
}

extensions() {
	synced_list="$DOTFILES/vscode/extensions"
	current_state="$DOTFILES/vscode/currently-installed-extensions"
	working_list="$DOTFILES/vscode/working-list"
	base_url="https://marketplace.visualstudio.com/items?itemName="

	# capture current state and create our working state
	code --list-extensions >$current_state
	mv $synced_list $working_list
	touch $synced_list

	for extension in $(cat $working_list); do
		url="$base_url$extension"

		if grep -q "$extension" $current_state; then
			save-extension $extension $synced_list
			remove-extension $extension $current_state
		else
			info "The following extension has not been installed locally:"
			info "$url"
			user_prompt "Would you like to [i]nstall, [s]kip, or [d]iscard it?"
			read -n 1 -p $'   \033[00;34m-->\033[0m ' action
			echo ""

			case "$action" in
			i)
				code --install-extension $extension
				save-extension $extension $synced_list
				;;
			s)
				save-extension $extension $synced_list
				;;
			*) ;;
			esac
		fi
	done

	for extension in $(cat $current_state); do
		url="$base_url$extension"

		info "The following locally installed extension has not been synced:"
		info "$url"
		user_prompt "Would you like to [u]ninstall, [s]kip, or s[y]nc it?"
		read -n 1 -p $'   \033[00;34m-->\033[0m ' action
		echo ""

		case "$action" in
		u)
			code --uninstall-extension $extension
			;;
		y)
			save-extension $extension $synced_list
			;;
		*) ;;
		esac
	done

	# clean up temp files
	rm $current_state
	rm $working_list
}

save-extension() {
	extension=$1
	list=$2
	echo "$extension" >>$list
}

remove-extension() {
	extension=$1
	list=$2
	sed -i "" "/$extension/d" $list
}

main() {
	info "syncing VS Code settings..."
	settings
	info "syncing VS Code extensions..."
	extensions
	echo ""
	success "done with VS Code setup!"
}

main
