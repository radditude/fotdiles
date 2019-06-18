# CJ Has Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

Strongly influenced by [holman/dotfiles](https://github.com/holman/dotfiles/).

## Directory

- asdf: global config for the `asdf` language version manager
- bin: everything in here gets loaded into my `$PATH`, so this is where I keep little one off scripts and CLI tools
- fotdiles: scripts that get called by `bin/fotdiles` during installation and updates
- functions: a place to keep shared utility functions
- homebrew: Brewfile, etc
- iterm2: iterms settings and defaults
- macos: useful macos defaults
- todo: config and plugins for the todo.txt CLI
- vscode: vscode settings
- zsh: shell config

## Usage (buyer beware, etc)

Clone:

```
git clone https://github.com/radditude/fotdiles.git ~/.fotdiles
```

Install:

```
cd ~/.fotdiles
./bin/fotdiles
source ~/.zshrc
```

Update:

```
fotdiles
```
