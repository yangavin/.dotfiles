# dotfiles

This repository contains all my configuration dotfiles (stored in the `root` folder)

## Prerequisite

Install all packages needed (working on automating this with ansible)

- zsh
- oh-my-zsh
- powerlevel10k
- zsh-syntax-highlighting
- zsh-autocomplete
- neovim
- ripgrep
- fzf
- lsd
- stow

## Installation

Clone the repository to your root directory with:

```bash
git clone --recurse-submodules https://github.com/yangavin/.dotfiles ~/.dotfiles
```

Stow the config folder with:

```bash
cd ~/.dotfiles
stow root
```

This will symlink all the configuration dotfiles to the `$HOME` directory.
