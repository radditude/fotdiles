#!/usr/bin/env bash

source $DOTFILES/functions/log

if brew --prefix asdf
then
  info "configuring asdf"
  asdf plugin add ruby
  asdf plugin add nodejs
  asdf plugin add golang
  asdf plugin update --all
  # install keys for nodejs
  bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
  # run asdf install twice because sometimes language installs exit with
  # non-zero codes even if the install succeeds (looking at you, Erlang)
  cd $HOME && asdf install && asdf install

  echo ""
  success "asdf configuration complete!"
else
  info "asdf not installed, skipping asdf configuration"
fi
