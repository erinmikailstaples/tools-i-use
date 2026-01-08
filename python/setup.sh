#!/bin/bash

set -e

echo "Setting up Python environment with uv..."

# Verify uv is installed
if ! command -v uv &> /dev/null; then
    echo "Error: uv is not installed. It should have been installed via Homebrew."
    exit 1
fi

echo "UV is installed at: $(which uv)"
echo "UV version: $(uv --version)"

# Set up default Python with uv
echo "Installing latest Python version with uv..."
uv python install

# Create a default global Python environment
echo "Setting up global Python environment..."
mkdir -p "$HOME/.local/python-env"

echo "Python environment setup complete!"
echo "Use 'uv' to manage Python packages instead of pip"
echo "Example: uv pip install <package>"
