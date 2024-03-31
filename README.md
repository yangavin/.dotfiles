# dotfiles

This repository contains all my configuration dotfiles for zsh and git.
Use stow to symlink the dotfiles to the `$HOME` directory.

## Prerequisite

- zsh
- stow
- lsd
- bat

### Optional

- nvim
- lazygit
- gh
- bw
- fswatch

## nvim

I have a separate repository for my neovim configuration.
Go to [yangavin/neovim](https://github.com/yangavin/neovim)
for more information.

## Installation

Clone the repository to your root directory with:

```bash
git clone --recurse-submodules https://github.com/yangavin/.dotfiles ~/.dotfiles
```

`cd` into the repo:

```bash
cd ~/.dotfiles
```

Symlink dotfiles with stow:

```bash
stow zshgit
```
