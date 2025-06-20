#!/usr/bin/env bash

function doIt() {
    # Create necessary directories
    mkdir -p ~/.shell ~/.config/fish/functions
    
    # Copy files to home directory
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
    
    # Set correct permissions for executable files
    find ~/.shell -name "*.sh" -type f -exec chmod +x {} \;
    
    echo "Dotfiles installed successfully!"
    echo "To completely apply changes, restart your shell or run:"
    echo "  - For bash: source ~/.bashrc"
    echo "  - For zsh:  source ~/.zshrc"
    echo "  - For fish: source ~/.config/fish/config.fish"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
