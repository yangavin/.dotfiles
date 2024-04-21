# initialize homebrew enviornment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_BUNDLE_FILE="$HOME/Brewfile"
# change lazygit config path
export XDG_CONFIG_HOME="$HOME/.config" 
