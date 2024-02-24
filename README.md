# dotfiles

This repository contains all my configuration dotfiles (stored in the `config` folder)

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
git clone https://github.com/yangavin/.dotfiles ~/.dotfiles
```

Stow the config folder with:

```bash
stow config
```

This will symlink all the configuration dotfiles to the `$HOME` directory.
