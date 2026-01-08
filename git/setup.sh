#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up Git configuration..."

# Copy gitconfig
if [ -f "$SCRIPT_DIR/gitconfig" ]; then
    cat "$SCRIPT_DIR/gitconfig" >> "$HOME/.gitconfig"
    echo "Git configuration added to ~/.gitconfig"
fi

# Copy global gitignore
if [ -f "$SCRIPT_DIR/gitignore_global" ]; then
    cp "$SCRIPT_DIR/gitignore_global" "$HOME/.gitignore_global"
    git config --global core.excludesfile "$HOME/.gitignore_global"
    echo "Global gitignore configured"
fi

echo "Git setup complete!"
echo "Don't forget to set your name and email:"
echo "  git config --global user.name 'Your Name'"
echo "  git config --global user.email 'your.email@example.com'"
