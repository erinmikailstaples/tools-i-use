#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting developer environment setup...${NC}\n"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to print section headers
print_section() {
    echo -e "\n${YELLOW}===> $1${NC}\n"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not present
print_section "Checking Homebrew installation"
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed"
    brew update
fi

# Install packages from Brewfile
print_section "Installing Homebrew packages"
if [ -f "$SCRIPT_DIR/Brewfile" ]; then
    # --no-upgrade prevents upgrading already-installed packages
    # This saves time and skips packages that are already installed
    brew bundle --file="$SCRIPT_DIR/Brewfile" --no-upgrade
else
    echo -e "${RED}Brewfile not found!${NC}"
fi

# Setup Git configuration
print_section "Setting up Git configuration"
if [ -f "$SCRIPT_DIR/git/gitconfig" ]; then
    bash "$SCRIPT_DIR/git/setup.sh"
fi

# Setup Neovim
print_section "Setting up Neovim"
if [ -d "$SCRIPT_DIR/nvim" ]; then
    bash "$SCRIPT_DIR/nvim/setup.sh"
fi

# Setup shell (zsh)
print_section "Setting up shell configuration"
if [ -f "$SCRIPT_DIR/shell/setup.sh" ]; then
    bash "$SCRIPT_DIR/shell/setup.sh"
fi

# Setup Python environment with uv
print_section "Setting up Python environment"
if [ -f "$SCRIPT_DIR/python/setup.sh" ]; then
    bash "$SCRIPT_DIR/python/setup.sh"
fi

# Setup macOS defaults
print_section "Configuring macOS defaults"
if [ -f "$SCRIPT_DIR/macos/defaults.sh" ]; then
    bash "$SCRIPT_DIR/macos/defaults.sh"
fi

# Setup Developer Advocate tools
print_section "Setting up Developer Advocate tools"
if [ -f "$SCRIPT_DIR/devrel/setup.sh" ]; then
    bash "$SCRIPT_DIR/devrel/setup.sh"
fi

echo -e "\n${GREEN}Setup complete! 🎉${NC}"
echo -e "${YELLOW}Note: Some changes may require logging out and back in.${NC}\n"
