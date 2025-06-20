# environment.fish - Environment variables for modern development

# Remove fish greeting message
set -g fish_greeting ""

# Terminal settings
set -gx TERM xterm-256color
set -gx CLICOLOR 1
set -gx LSCOLORS "exfxcxdxbxegedabagacad"

# Set editor preference (use nvim if available, otherwise vim)
command -qv nvim && set -gx EDITOR nvim || set -gx EDITOR vim

# Set default language and locale
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# =======================================================
# PATH Configuration - all PATH additions in one place
# =======================================================

# User bins
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Homebrew
if test -d /opt/homebrew/bin
    # For Apple Silicon
    set -gx PATH /opt/homebrew/bin $PATH
    set -gx PATH /opt/homebrew/sbin $PATH
else if test -d /usr/local/bin
    # For Intel Mac
    set -gx PATH /usr/local/bin $PATH
    set -gx PATH /usr/local/sbin $PATH
end

# =======================================================
# Development Environment Configurations
# =======================================================

# Go configuration
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Node.js configuration
set -gx PATH node_modules/.bin $PATH
set -gx NODE_REPL_HISTORY ~/.node_history
set -gx NODE_REPL_HISTORY_SIZE 32768
set -gx NODE_REPL_MODE sloppy

# Python configuration
set -gx PYTHONIOENCODING UTF-8

# Rust configuration
if test -d $HOME/.cargo/bin
    set -gx PATH $HOME/.cargo/bin $PATH
end

# GPG configuration
set -gx GPG_TTY (tty)

# Less configuration
set -gx LESS_TERMCAP_md (set_color --bold yellow)
set -gx MANPAGER 'less -X'

# macOS specific settings
if test (uname) = "Darwin"
    # Prevent creating .DS_Store files on network volumes
    set -gx COPYFILE_DISABLE 1
end
