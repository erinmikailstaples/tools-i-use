#!/bin/bash

set -e

echo "Setting up Developer Advocate tools..."

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Ray.so CLI (for beautiful code screenshots)
echo "Checking for Ray.so CLI..."
if ! command_exists ray; then
    echo "Installing Ray.so CLI..."
    npm install -g ray-so
else
    echo "Ray.so CLI already installed"
fi

# Install Goose (if available via npm/homebrew in the future)
# Note: Goose may need manual installation depending on the specific tool
echo "Checking for Goose..."
if ! command_exists goose; then
    echo "Goose installation:"
    echo "  Please visit https://github.com/square/goose for installation instructions"
    echo "  Or install via: brew install goose-lang (if available)"
else
    echo "Goose already installed"
fi

echo ""
echo "Developer Advocate tools setup complete!"
echo ""
echo "Web-based tools (require browser access):"
echo "  - Ray.so: https://ray.so (for code screenshots)"
echo "  - Canva: Install from Mac App Store or use web version"
echo ""
echo "Additional setup needed:"
echo "  - 1Password: Sign in with your account after installation"
echo "  - Loom: Sign in with your account after installation"
echo "  - Discord: Sign in with your account after installation"
echo "  - Stream Deck: Configure with Elgato software after installation"
