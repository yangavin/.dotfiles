# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source p10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# source p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add autocomplete
source ~/.dotfiles/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Configure autocomplete to run suggestion on <CR>
bindkey -M menuselect '\r' .accept-line

# Add syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autocd
setopt autocd
# autocd for previous directory (-)
alias -- -="cd -"

# Aliases
alias g=git
alias ls=lsd
alias la="ls -A"
alias l="ls -lA"
alias cat=bat
alias n=nvim
alias lg=lazygit
alias vault="npx dotenv-vault"
alias repo="gh repo view --web"
alias c="code ."
alias cs="cursor ."
alias o="open ."
alias :q="echo not 👏 in 👏 vim 👏" # Silly message for a silly mistake
