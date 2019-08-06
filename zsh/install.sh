#!/usr/bin/env bash

# make zsh the default shell if it isn't already
if [[ "$SHELL" != *"zsh"* ]]; then
	sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi

# install oh-my-zsh if needed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# update oh-my-zsh
sh $HOME/.oh-my-zsh/tools/upgrade.sh
