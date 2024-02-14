#! /bin/bash

DIR="$(dirname "$(readlink -f "$0")")"
ln -fs "$DIR"/config/.* "$HOME"/

# Install zsh for linux
if [[ $OSTYPE == "linux-gnu"* ]]; then
    echo installing zsh
    apt install zsh
fi

# Install oh-my-zsh
echo INSTALLING OH-MY-ZSH
sh -c "RUNZSH='no' KEEP_ZSHRC='yes' $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
echo INSTALLING POWERLEVEL10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install zsh-syntax-highlighting
echo INSTALLING ZSH-SYNTAX-HIGHLIGHTING 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autocomplete
echo INSTALLING ZSH-AUTOCOMPLETE
git clone https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# Install lsd
echo "INSTALLING LSD"
if [[ $OSTYPE == "linux-gnu"* ]]; then
    if apt install lsd; then
        echo SUCCESSFULLY INSTALLED LSD
    else
        echo "CANNOT INSTALL LSD FROM APT, USING LS INSTEAD"
        sed -i '114d' "$DIR"/config/.zshrc
    fi
elif [[ $OSTYPE == "darwin"* ]]; then
    brew install lsd
else
    echo "cannot detect OS as linux or macOS, please manually install lsd instead"
fi

echo COMPELTE