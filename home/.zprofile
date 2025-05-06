# initialize homebrew enviornment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_BUNDLE_FILE="$HOME/Brewfile"
FPATH="${FPATH}:$(brew --prefix)/share/zsh/site-functions"
# change lazygit config path
export XDG_CONFIG_HOME="$HOME/.config" 

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion