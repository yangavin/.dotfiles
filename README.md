# dotfiles

This repository contains all my configuration dotfiles.
Use stow to symlink the `home` directory to the `$HOME` directory.

For macos specific configurations, use the `macos` directory.

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

Symlink `home` with stow:

```bash
stow home
```

Symlink macos with stow:

```bash
stow macos
```

To install all homebrew packages, run:

```bash
brew bundle --file=macos/Brewfile
```
