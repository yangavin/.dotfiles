# dotfiles

This repository contains all my configuration dotfiles for setting up new machines.

The idea is to use stow to symlink the `home` directory to the `$HOME` directory,
and install all software with homebrew.

I have a separate repository for my neovim configuration.
Go to [yangavin/neovim](https://github.com/yangavin/neovim)
for more information.

iTerm2 setting is stored outside the home folder (since it doesn't need to be symlinked)

## Prerequisites

- zsh
- git
- brew
- stow

## Installation

Clone the repository to your root directory with:

```bash
git clone git@github.com:yangavin/.dotfiles.git ~/.dotfiles
```

`cd` into the repo:

```bash
cd ~/.dotfiles
```

Symlink `home` with stow:

```bash
stow home
```

Install all homebrew packages with:

```bash
brew bundle install
```

Load iTerm2 settings:

Preferences -> General -> Preferences -> Load preferences from a custom folder or URL

Point it to this repo
