#!/bin/sh
# Shell-agnostic aliases
# This file is sourced by all shells (bash, zsh, fish via a wrapper)

# Navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Directory shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Developer"

# Git shortcuts
alias g="git"
alias gst="git status"
alias ga="git add"
alias grm="git rm"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"

# File operations
alias c="tr -d '\n' | pbcopy"  # Trim new lines and copy to clipboard

# System shortcuts
alias h="history"
alias j="jobs"

# Network tools
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Filesystem commands
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# macOS commands
if [ "$(uname)" = "Darwin" ]; then
    # Show/hide hidden files in Finder
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
    
    # Hide/show all desktop icons
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
    
    # Spotlight
    alias spotoff="sudo mdutil -a -i off"
    alias spoton="sudo mdutil -a -i on"
fi

# Utilities
alias week="date +%V"
alias timer="echo \"Timer started. Stop with Ctrl-D.\" && date && time cat && date"

# Enable sudo for aliases - this will be handled differently in fish
alias sudo="sudo "
