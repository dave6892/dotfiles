#!/bin/sh
# Shell-agnostic exports
# This file is sourced by all shells (bash, zsh, fish via a wrapper)

# Make vim the default editor (prefer nvim if available)
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

# Terminal settings
export TERM="xterm-256color"
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Node.js configuration
export NODE_REPL_HISTORY="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE="32768"
export NODE_REPL_MODE="sloppy"

# Python configuration
export PYTHONIOENCODING="UTF-8"
export PYTHONDONTWRITEBYTECODE=1

# Increase shell history size
export HISTSIZE=32768
export HISTFILESIZE=32768
export HISTCONTROL="ignoreboth"

# Less configuration
export LESS_TERMCAP_md="\033[1;33m"
export MANPAGER="less -X"

# GPG configuration
export GPG_TTY=$(tty)

# macOS specific settings
if [ "$(uname)" = "Darwin" ]; then
    # Prevent creating .DS_Store files on network volumes
    export COPYFILE_DISABLE=1
fi
