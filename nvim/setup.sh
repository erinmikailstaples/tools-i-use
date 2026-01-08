#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

echo "Setting up Neovim configuration..."

# Backup existing config if it exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing Neovim config..."
    mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create config directory
mkdir -p "$NVIM_CONFIG_DIR"

# Copy configuration files
cp -r "$SCRIPT_DIR/." "$NVIM_CONFIG_DIR/"

echo "Neovim configuration installed!"
echo "Run 'nvim' to complete plugin installation"
