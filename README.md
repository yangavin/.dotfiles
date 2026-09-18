# Dotfiles

This repository contains all my configuration dotfiles and automated setup scripts for quickly configuring new macOS machines.

## Quick Start

### One-Line Installation

Run this command to automatically set up everything:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/yangavin/.dotfiles/main/install.sh)
```

This will:

- Clone this repository to `~/.dotfiles`
- Install Homebrew (if not already installed)
- Allow you to customize the Brewfile
- Install all packages and applications
- Symlink dotfiles to your home directory
- Configure Git with your email and name
- Generate and set up SSH keys for GitHub
- Test GitHub SSH connection

## Manual Installation

If you prefer to run the installation step by step:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yangavin/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installation script:**

   ```bash
   ./install.sh
   ```

3. **Configure macOS preferences (optional):**
   ```bash
   ./macos.sh
   ```
