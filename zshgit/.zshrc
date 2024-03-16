# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source p10k
source ~/.zshplugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Add homebrew binaries to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add autocomplete
source $HOME/.zshplugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Configure autocomplete to run suggestion on <CR>
bindkey -M menuselect '\r' .accept-line

# Add syntax highlighting
source $HOME/.zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt autocd

# Aliases
alias g=git
alias ls="lsd"
alias la="ls -a"
alias cat=bat
alias n=nvim
alias lg=lazygit
getpw(){
  bw get password "$1" | pbcopy
}
alias :q="echo not 👏 in 👏 vim 👏" # Silly message for a silly mistake
