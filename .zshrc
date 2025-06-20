# ~/.zshrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source shell-agnostic configurations
for file in ~/.shell/{path,exports,aliases,functions}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# ZSH-specific settings
# -----------------------

# Path to your oh-my-zsh installation (if you use it)
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# ZSH options
setopt AUTO_CD              # Auto change to a dir without typing cd
setopt EXTENDED_HISTORY     # Write format
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS     # Do not enter command lines into the history list if they are duplicates
setopt HIST_IGNORE_SPACE    # Remove command lines from the history list when the first character is a space
setopt HIST_VERIFY          # Expand history onto the current line instead of executing it
setopt SHARE_HISTORY        # Share history between all sessions

# Load plugins (if you use oh-my-zsh)
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    plugins=(git macos docker docker-compose)
    source $ZSH/oh-my-zsh.sh
fi

# Source local configuration if it exists
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
