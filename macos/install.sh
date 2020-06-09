#!/usr/bin/env bash -e

source $DOTFILES/functions/log

info "running software update - password may be required"

sudo softwareupdate -i -a

info "writing mac defaults"

# finder should show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles true

# set a custom location for screenshots so they don't clutter up the desktop
screenshot_directory="$HOME/Pictures/screenshots"

if [ ! -d $screenshot_directory ]; then
	mkdir $screenshot_directory
fi

defaults write com.apple.screencapture location $screenshot_directory

# do show external volumes on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# get rid of the dashboard because I never use it
defaults write com.apple.dashboard mcx-disabled -boolean YES
# only show the currently open apps in the dock
defaults write com.apple.dock static-only -bool TRUE
killall Dock

# add the QUIT option to the finder menu
defaults write com.apple.finder QuitMenuItem -bool true && killall Finder

# disable ipv6
networksetup -setv6off Wi-Fi

# key repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled
