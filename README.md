# CJ Has Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

Strongly influenced by [holman/dotfiles](https://github.com/holman/dotfiles/).

## Directory

- asdf: global config for the `asdf` language version manager
- bin: everything in here gets loaded into my `$PATH`, so this is where I keep small one off scripts and CLI tools.
- fotdiles: utilities for installation and updates that get called by `fotdiles.sh`
- git: git and hub-related functions and aliases
- homebrew: Brewfile, etc
- zsh: zsh and oh-my-zsh config

## Usage

Clone:

```
git clone https://github.com/radditude/fotdiles.git ~/.fotdiles
```

Install:

```
cd ~/.fotdiles
./bin/fotdiles
```

Update:

```
fotdiles
```

Further documentation can be found [in the install script](install.sh).
