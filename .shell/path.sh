#!/bin/sh
# Shell-agnostic PATH configuration
# This file is sourced by all shells (bash, zsh, fish via a wrapper)

# User bins
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# Homebrew paths
if [ -d "/opt/homebrew/bin" ]; then
    # For Apple Silicon
    PATH="/opt/homebrew/bin:$PATH"
    PATH="/opt/homebrew/sbin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    # For Intel Mac
    PATH="/usr/local/bin:$PATH"
    PATH="/usr/local/sbin:$PATH"
fi

# Go configuration
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# Node.js configuration
PATH="$PWD/node_modules/.bin:$PATH"

# Rust configuration
if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH
