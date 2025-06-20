# Navigation shortcuts
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# Directory shortcuts
alias d "cd ~/Documents"
alias dl "cd ~/Downloads"
alias dt "cd ~/Desktop"
alias dev "cd ~/Developer"

# Git shortcuts
alias g "git"
alias gst "git status"
alias ga "git add"
alias grm "git rm"
alias gc "git commit"
alias gp "git push"
alias gl "git pull"
alias gd "git diff"
alias gb "git branch"
alias gco "git checkout"

# Modern ls alternatives (using exa if available)
if type -q exa
    alias ls "exa"
    alias ll "exa -l -g --icons"
    alias la "exa -la -g --icons"
    alias lt "exa -l -g --icons --tree"
    alias lsd "exa -l -g --icons -D"
else
    # Fallback to regular ls with colors
    alias ls "ls -G"
    alias ll "ls -lhG"
    alias la "ls -lahG"
    alias lsd "ls -lhG | grep --color=never '^d'"
end

# File operations
alias c "tr -d '\n' | pbcopy"  # Trim new lines and copy to clipboard

# System shortcuts
alias h "history"
alias j "jobs"

# Enable sudo for aliases
function sudo
    if test "$argv" = ""
        command sudo fish
    else
        command sudo $argv
    end
end

# Network tools
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias flush "dscacheutil -flushcache && killall -HUP mDNSResponder"  # Flush DNS cache

# Finder commands
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"  # Recursively delete .DS_Store files
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"  # Show hidden files
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"  # Hide hidden files
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"  # Hide desktop icons
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"  # Show desktop icons

# Utils
alias week 'date +%V'  # Get week number
alias timer 'echo "Timer started. Stop with Ctrl-D." && date && time cat && date'  # Stopwatch

# Spotlight
alias spotoff "sudo mdutil -a -i off"  # Disable Spotlight
alias spoton "sudo mdutil -a -i on"  # Enable Spotlight

# Quick reload fish config
alias reload "source ~/.config/fish/config.fish"
