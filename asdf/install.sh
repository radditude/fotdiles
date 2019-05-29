#!/usr/bin/env bash

source $DOTFILES/functions/log

if [ -d "$HOME/.asdf" ]
then
  info "configuring asdf"
  asdf plugin-add ruby
  asdf plugin-add nodejs
  asdf plugin-add elixir
  asdf plugin-add erlang
  asdf plugin-update --all
  cd $HOME && asdf install

  success "asdf configuration complete!"
else
  info "asdf not installed, skipping asdf configuration"
fi
