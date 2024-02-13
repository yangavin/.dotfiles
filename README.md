# dotfiles

This repository contains all my configuration dotfiles (stored in the `config` folder)

## Prerequisite

For MacOS, install Homebrew with:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For Linux, update and upgrade `apt` with:

```bash
sudo apt update && sudo apt upgrade
```

## Installation

Clone the repo to your user root directory:

```bash
git clone https://github.com/yangavin/dotfiles.git ~/.dotfiles
```

Run the `install.sh` script with:

```bash
~/.dotfiles/install.sh
```

This will symlink all the configuration dotfiles to the `$HOME` directory and install:

- [zsh](https://en.wikipedia.org/wiki/Z_shell) (If you're on Linux)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
- [lsd](https://github.com/lsd-rs/lsd)
