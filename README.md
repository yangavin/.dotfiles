# 🏠 Dotfiles

This repository contains all my configuration dotfiles and automated setup scripts for quickly configuring new macOS machines.

## 🚀 Quick Start

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

## 📁 Repository Structure

```
.dotfiles/
├── install.sh          # Main installation script
├── macos.sh            # macOS system preferences
├── home/               # Dotfiles to be stowed
│   ├── .zshrc
│   ├── .gitconfig
│   ├── .vimrc
│   ├── Brewfile        # Homebrew packages
│   └── .config/        # Application configs
├── minimal/            # Minimal setup option
└── README.md
```

## 🔧 Manual Installation

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

## 🍎 macOS Configuration

The `macos.sh` script configures macOS system preferences:

- Disables boot sound
- Shows battery percentage in menu bar
- Enables tap-to-click on trackpad
- Maximizes trackpad speed
- Disables Spotlight and its shortcuts
- Disables accented character popup (enables key repeat)
- Sets maximum key repeat speed
- Enables two-finger swipe navigation
- Shows hidden files and file extensions
- Disables auto-correct and smart substitutions

Run it with:

```bash
./macos.sh
```

## 🔑 SSH Key Setup

The installation script automatically:

- Generates an Ed25519 SSH key named "github"
- Copies the public key to your clipboard
- Provides instructions for adding it to GitHub
- Configures SSH for both GitHub.com and GitHub Enterprise
- Tests the SSH connection

## 🎯 Customization

### Modifying Packages

Edit the `home/Brewfile` to customize which packages are installed:

```bash
vim home/Brewfile
```

### Adding Dotfiles

1. Add your dotfiles to the `home/` directory
2. Run `stow home` from the repository root to symlink them

### Custom Configurations

- **Zsh**: Edit `home/.zshrc`
- **Git**: Edit `home/.gitconfig`
- **Vim**: Edit `home/.vimrc`
- **App configs**: Add to `home/.config/`

## 🔄 Updating

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
stow --restow home
```

To update Homebrew packages:

```bash
brew bundle install --file=~/.dotfiles/home/Brewfile
```

## 🆘 Troubleshooting

### SSH Key Issues

If GitHub SSH connection fails:

```bash
ssh -T git@github.com
```

### Stow Conflicts

If stow reports conflicts:

```bash
stow --adopt home  # Adopt existing files
git checkout .     # Restore repository versions
```

### Homebrew Issues

If packages fail to install:

```bash
brew doctor
brew update
```

## 📝 License

This repository is for personal use. Feel free to fork and adapt for your own needs.

---

**Happy coding!** 🚀
