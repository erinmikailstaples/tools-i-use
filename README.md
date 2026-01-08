# Developer Environment Setup

This repository contains my personal developer environment configuration for macOS. It automates the setup of a new machine with all the tools, configurations, and applications I use.

## 🚀 Quick Start

Clone this repository and run the setup script:

```bash
git clone https://github.com/yourusername/tools-i-use.git
cd tools-i-use
chmod +x setup.sh
./setup.sh
```

## 📦 What's Included

### Package Manager
- **Homebrew**: Package manager for macOS

### Development Tools
- **Git** with custom configuration and global gitignore
- **Neovim** with LSP, Treesitter, and essential plugins
- **Python** environment managed with `uv`
- **Node.js**, **Go**, and **Rust** toolchains
- **Docker** and Docker Compose

### CLI Tools
- `ripgrep` - Fast text search
- `fd` - Fast file finder
- `fzf` - Fuzzy finder
- `bat` - Better cat with syntax highlighting
- `eza` - Modern ls replacement
- `zoxide` - Smarter cd command
- `gh` - GitHub CLI
- `tldr` - Simplified man pages
- `jq` / `yq` - JSON/YAML processors
- `tmux` - Terminal multiplexer

### Shell Configuration
- **Zsh** with Oh My Zsh
- Custom plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
- Useful aliases and environment variables

### Applications (via Homebrew Cask)
- Visual Studio Code
- iTerm2
- Docker Desktop
- Postman
- Rectangle (window management)
- Raycast (Spotlight replacement)
- Nerd Fonts (Fira Code, JetBrains Mono, Hack)

### Developer Advocate Tools
- **Loom** - Video recording for demos
- **CleanShot X** - Advanced screenshots
- **Figma** - Design and prototyping
- **Insomnia** - API testing
- **Canva** - Graphics creation
- **1Password** - Secure credentials
- **Stream Deck** - Streaming control
- **Discord** - Community management
- **Asciinema** - Terminal recording
- **Glow** - Markdown viewer

## 📁 Repository Structure

```
.
├── setup.sh              # Main setup script
├── Brewfile              # Homebrew packages and casks
├── git/
│   ├── setup.sh          # Git configuration setup
│   ├── gitconfig         # Git configuration
│   └── gitignore_global  # Global gitignore
├── nvim/
│   ├── setup.sh          # Neovim setup
│   └── init.lua          # Neovim configuration
├── shell/
│   ├── setup.sh          # Shell setup
│   └── zshrc             # Zsh configuration
├── python/
│   ├── setup.sh          # Python environment setup
│   └── requirements.txt  # Common Python packages
├── macos/
│   └── defaults.sh       # macOS system preferences
└── devrel/
    ├── setup.sh          # Developer advocate tools setup
    └── README.md         # DevRel tools documentation
```

## 🔧 Component Setup

You can run individual setup scripts if you only want to configure specific components:

```bash
# Install Homebrew packages only
brew bundle --file=Brewfile

# Setup Neovim only
bash nvim/setup.sh

# Setup shell configuration only
bash shell/setup.sh

# Setup Python environment only
bash python/setup.sh

# Configure macOS defaults only
bash macos/defaults.sh

# Setup Git configuration only
bash git/setup.sh

# Setup Developer Advocate tools only
bash devrel/setup.sh
```

## 🐍 Python with UV

This setup uses `uv` as the Python package manager. Key features:

- Faster than pip
- Better dependency resolution
- Use `uv` instead of `pip` for package installation
- Alias configured: `pip` → `uv pip`

Example usage:
```bash
# Install packages
uv pip install requests

# Install from requirements file
uv pip install -r python/requirements.txt

# Create a virtual environment
uv venv

# Run Python
uv run python script.py
```

## ⌨️ Neovim Configuration

The Neovim setup includes:

- **Plugin Manager**: lazy.nvim
- **LSP Support**: Python, JavaScript/TypeScript, Go, Rust, Lua
- **Fuzzy Finding**: Telescope
- **File Explorer**: nvim-tree
- **Git Integration**: gitsigns, fugitive
- **Auto-completion**: nvim-cmp
- **Syntax Highlighting**: Treesitter
- **Color Scheme**: Tokyo Night

### Key Bindings

- Leader key: `<Space>`
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>w` - Save file
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show documentation

## 🎨 Customization

### Adding Homebrew Packages

Edit `Brewfile` and add your package:
```ruby
brew "package-name"
cask "application-name"
```

Then run:
```bash
brew bundle --file=Brewfile
```

### Modifying Shell Configuration

Edit `shell/zshrc` to add custom aliases, functions, or environment variables.

### Updating Neovim Plugins

Edit `nvim/init.lua` and add plugins to the `lazy.setup()` section.

## 🔄 Keeping Dependencies Updated

Dependencies use the newest compatible versions (no hard pinning):

```bash
# Update Homebrew packages
brew update && brew upgrade

# Update Neovim plugins
nvim and run :Lazy update

# Update Python packages
uv pip list --outdated
uv pip install --upgrade <package>
```

## 🍎 macOS Defaults

The `macos/defaults.sh` script configures sensible defaults including:

- Show hidden files in Finder
- Enable key repeat
- Disable auto-correct
- Customize Dock behavior
- Configure screenshots
- And more...

Review and customize these settings before running.

## 📝 Post-Setup

After running the setup:

1. **Set Git identity**:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

2. **Restart your terminal** or run:
   ```bash
   source ~/.zshrc
   ```

3. **Configure SSH keys** for GitHub:
   ```bash
   ssh-keygen -t ed25519 -C "your.email@example.com"
   gh auth login
   ```

4. **Open Neovim** to complete plugin installation:
   ```bash
   nvim
   ```

## 🛠️ Troubleshooting

### Homebrew not found
For Apple Silicon Macs, add to your shell profile:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Permission issues
Some scripts may require sudo access. Review the scripts before running.

### Neovim plugins not loading
Open Neovim and run `:Lazy sync`

## 📜 License

MIT License - feel free to use and modify for your own setup!

## 🤝 Contributing

This is a personal configuration repository, but suggestions and improvements are welcome via issues or pull requests.
