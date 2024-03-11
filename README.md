# dotfiles

This repository contains all my configuration dotfiles. Use stow to symlink the dotfiles to the `$HOME` directory.

## zshgit

This stores all zsh and git configurations.

### Prerequisite

Install all packages needed (working on automating this with ansible)

- zsh
- lsd
- bat

## nvim

This stores all neovim configurations. Go to [yangavin/neovim](https://github.com/yangavin/nvim/tree/main) for more information.

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
