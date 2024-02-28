# dotfiles

This repository contains all my configuration dotfiles.

## Prerequisite

Install all packages needed (working on automating this with ansible)

### zshgit

- zsh
- stow
- lsd

### nvim

- neovim
- ripgrep
- fzf
- lsd

## Installation

Clone the repository to your root directory with:

```bash
git clone --recurse-submodules https://github.com/yangavin/.dotfiles ~/.dotfiles
```

`cd` into the repo:

```bash
cd ~/.dotfiles
```

To apply the configuration for zsh and git:

```bash
stow zshgit
```

To apply configuration for nvim:

```bash
stow nvim
```

This will symlink all the configuration dotfiles to the `$HOME` directory.
