#!/usr/bin/env bash -e


NOTES_DIR="$HOME/Documents/notes"
VIM_CONFIG_SOURCE="$DOTFILES/obsidian/.obsidian.vimrc"

for dir in $(ls -d $NOTES_DIR/*); do
  ln -s $VIM_CONFIG_SOURCE $dir/.obsidian.vimrc
done
