#!/bin/bash

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're already in the dotfiles directory
if [[ "$(basename "$PWD")" == ".dotfiles" ]]; then
    print_status "Already in .dotfiles directory"
    DOTFILES_DIR="$PWD"
else
    # Clone dotfiles repository
    DOTFILES_DIR="$HOME/.dotfiles"
    
    if [[ -d "$DOTFILES_DIR" ]]; then
        print_warning "Dotfiles directory already exists at $DOTFILES_DIR"
        read -p "Do you want to remove it and re-clone? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_status "Removing existing dotfiles directory..."
            rm -rf "$DOTFILES_DIR"
        else
            print_status "Using existing dotfiles directory"
        fi
    fi
    
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        print_status "Cloning dotfiles repository..."
        # Replace with your actual dotfiles repository URL
        read -p "Enter your dotfiles repository URL: " REPO_URL
        git clone "$REPO_URL" "$DOTFILES_DIR"
        print_success "Dotfiles repository cloned successfully"
    fi
    
    # Change to dotfiles directory
    cd "$DOTFILES_DIR"
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    print_success "Homebrew installed successfully"
else
    print_success "Homebrew is already installed"
fi

# Check if Brewfile exists
BREWFILE_PATH="$DOTFILES_DIR/home/Brewfile"
if [[ ! -f "$BREWFILE_PATH" ]]; then
    print_error "Brewfile not found at $BREWFILE_PATH"
    exit 1
fi

# Prompt user to edit Brewfile
echo
print_status "The Brewfile contains the following packages and applications:"
echo "----------------------------------------"
head -20 "$BREWFILE_PATH"
if [[ $(wc -l < "$BREWFILE_PATH") -gt 20 ]]; then
    echo "... (and $(( $(wc -l < "$BREWFILE_PATH") - 20 )) more lines)"
fi
echo "----------------------------------------"
echo
print_warning "You can now edit the Brewfile to customize which packages to install."
print_warning "Remove any packages you don't want, or add new ones."
echo
read -p "Press Enter when you're ready to edit the Brewfile..." -r

# Open Brewfile in vim for editing
print_status "Opening Brewfile in vim for editing..."
vim "$BREWFILE_PATH"

print_success "Brewfile editing completed"

# Install packages using brew bundle
echo
print_status "Installing packages from Brewfile..."
cd "$DOTFILES_DIR/home"
brew bundle install --verbose

print_success "All packages installed successfully"

# Check if stow is available
if ! command -v stow &> /dev/null; then
    print_error "GNU Stow is not available. It should have been installed via Homebrew."
    print_error "Please check the Brewfile and ensure 'stow' is included."
    exit 1
fi

# Stow the home directory
echo
print_status "Stowing dotfiles from home directory..."
cd "$DOTFILES_DIR"

# Force stow to overwrite existing files
stow --target="$HOME" --restow --verbose home

print_success "Dotfiles stowed successfully"

###############################################################################
# Git Configuration and GitHub SSH Setup                                     #
###############################################################################

echo
print_status "Setting up Git configuration and GitHub SSH key..."

# Configure Git user email
echo
read -p "Enter your email address for Git commits: " GIT_EMAIL
if [[ -n "$GIT_EMAIL" ]]; then
    git config --global user.email "$GIT_EMAIL"
    print_success "Git email configured: $GIT_EMAIL"
else
    print_warning "No email provided, skipping Git email configuration"
fi

# Configure Git user name if not already set
if [[ -z "$(git config --global user.name)" ]]; then
    read -p "Enter your name for Git commits: " GIT_NAME
    if [[ -n "$GIT_NAME" ]]; then
        git config --global user.name "$GIT_NAME"
        print_success "Git name configured: $GIT_NAME"
    fi
fi

# GitHub SSH key setup
echo
print_status "Setting up GitHub SSH key..."

# Get GitHub hostname
echo "Which GitHub instance are you using?"
echo "1) github.com (default)"
echo "2) GitHub Enterprise (custom domain)"
read -p "Enter your choice (1 or 2): " GITHUB_CHOICE

case $GITHUB_CHOICE in
    2)
        read -p "Enter your GitHub Enterprise domain (e.g., github.company.com): " GITHUB_HOST
        ;;
    *)
        GITHUB_HOST="github.com"
        ;;
esac

print_status "Using GitHub host: $GITHUB_HOST"

# Check if SSH key already exists
SSH_KEY_PATH="$HOME/.ssh/github"
if [[ -f "$SSH_KEY_PATH" ]]; then
    print_warning "SSH key 'github' already exists at $SSH_KEY_PATH"
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_status "Using existing SSH key"
    else
        print_status "Removing existing SSH key..."
        rm -f "$SSH_KEY_PATH" "$SSH_KEY_PATH.pub"
    fi
fi

# Generate SSH key if it doesn't exist
if [[ ! -f "$SSH_KEY_PATH" ]]; then
    print_status "Generating new SSH key..."
    ssh-keygen -t ed25519 -f "$SSH_KEY_PATH" -C "$GIT_EMAIL" -N ""
    print_success "SSH key generated successfully"
fi

# Start SSH agent and add key
print_status "Adding SSH key to SSH agent..."
eval "$(ssh-agent -s)" > /dev/null
ssh-add "$SSH_KEY_PATH" 2>/dev/null

# Copy public key to clipboard
if command -v pbcopy &> /dev/null; then
    cat "$SSH_KEY_PATH.pub" | pbcopy
    print_success "Public key copied to clipboard!"
elif command -v xclip &> /dev/null; then
    cat "$SSH_KEY_PATH.pub" | xclip -selection clipboard
    print_success "Public key copied to clipboard!"
else
    print_warning "Could not copy to clipboard automatically"
fi

# Display public key
echo
print_status "Your public SSH key:"
echo "----------------------------------------"
cat "$SSH_KEY_PATH.pub"
echo "----------------------------------------"
echo

# Configure SSH for GitHub
SSH_CONFIG="$HOME/.ssh/config"
if [[ ! -f "$SSH_CONFIG" ]] || ! grep -q "Host $GITHUB_HOST" "$SSH_CONFIG"; then
    print_status "Configuring SSH for $GITHUB_HOST..."
    mkdir -p "$HOME/.ssh"
    cat >> "$SSH_CONFIG" << EOF

# GitHub configuration
Host $GITHUB_HOST
    HostName $GITHUB_HOST
    User git
    IdentityFile $SSH_KEY_PATH
    AddKeysToAgent yes
EOF
    chmod 600 "$SSH_CONFIG"
    print_success "SSH configuration added"
fi

# Instructions for adding key to GitHub
echo
print_warning "IMPORTANT: You need to add this SSH key to your GitHub account!"
echo
print_status "Steps to add the key:"
if [[ "$GITHUB_HOST" == "github.com" ]]; then
    echo "  1. Go to https://github.com/settings/ssh/new"
else
    echo "  1. Go to https://$GITHUB_HOST/settings/ssh/new"
fi
echo "  2. Give your key a title (e.g., 'My Mac')"
echo "  3. Paste the public key shown above (already copied to clipboard)"
echo "  4. Click 'Add SSH key'"
echo
read -p "Press Enter after you've added the SSH key to your GitHub account..." -r

# Test SSH connection
echo
print_status "Testing SSH connection to $GITHUB_HOST..."
if ssh -T git@$GITHUB_HOST -o StrictHostKeyChecking=no 2>&1 | grep -q "successfully authenticated"; then
    print_success "SSH connection to $GITHUB_HOST successful! 🎉"
else
    print_warning "SSH connection test failed. Please check:"
    echo "  - The SSH key was added correctly to your GitHub account"
    echo "  - Your GitHub username and permissions are correct"
    echo "  - Try running: ssh -T git@$GITHUB_HOST"
fi

# Final message
echo
print_success "🎉 Dotfiles installation completed!"
echo
print_status "What was done:"
echo "  ✓ Cloned dotfiles repository (if needed)"
echo "  ✓ Installed Homebrew (if needed)"
echo "  ✓ Allowed editing of Brewfile"
echo "  ✓ Installed all packages from Brewfile"
echo "  ✓ Stowed dotfiles to home directory"
echo "  ✓ Configured Git user email and name"
echo "  ✓ Generated SSH key for GitHub"
echo "  ✓ Configured SSH for GitHub access"
echo "  ✓ Tested GitHub SSH connection"
echo
print_warning "You may need to restart your terminal or run 'source ~/.zshrc' to apply all changes."
echo
print_status "Enjoy your new development environment! 🚀"
