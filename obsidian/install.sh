#!/usr/bin/env bash -e

NOTES_DIR="$HOME/notes"
VIM_CONFIG_SOURCE="$DOTFILES/obsidian/.obsidian.vimrc"

for dir in $(ls -d $NOTES_DIR/*); do
  rm $dir/.obsidian.vimrc
  ln -s $VIM_CONFIG_SOURCE $dir/.obsidian.vimrc
done
