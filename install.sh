#! /bin/bash

ln -fs "$(dirname "$0")"/config/.* "$HOME"/

# Install zsh for linux
if [[ $OSTYPE == "linux-gnu"* ]]; then
    echo installing zsh
    apt install zsh
fi

# Install oh-my-zsh
echo installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
echo installing p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install zsh-syntax-highlighting
echo installing zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autocomplete
echo installing zsh-autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# Install lsd
echo "installing lsd (with apt or homebrew)"
if [[ $OSTYPE == "linux-gnu"* ]]; then
    apt install lsd
elif [[ $OSTYPE == "darwin"* ]]; then
    brew install lsd
else
    echo "cannot detect OS as linux or macOS, please manually install lsd instead"
fi

# Source .zshrc
echo sourcing .zshrc
# shellcheck source=/dev/null
source "$HOME/.zshrc"

echo COMPELTE