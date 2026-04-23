#!/bin/zsh

# mac-config Setup Script
# This script deploys all configurations to their appropriate locations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${0:A}")" && pwd)"
BACKUP_DIR="$HOME/.config_backup/$(date +%Y%m%d_%H%M%S)"

# Helper functions
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

backup_if_exists() {
    local target="$1"
    if [[ -e "$target" && ! -L "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        cp -R "$target" "$BACKUP_DIR/"
        info "Backed up: $target"
    fi
}

link_config() {
    local source="$1"
    local target="$2"

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Backup existing non-symlink
    backup_if_exists "$target"

    # Remove existing symlink or file
    if [[ -L "$target" || -f "$target" ]]; then
        rm "$target"
    elif [[ -d "$target" ]]; then
        rm -rf "$target"
    fi

    # Create symlink
    ln -s "$source" "$target"
    success "Linked: $source -> $target"
}

# Main setup
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  mac-config Setup Script${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

info "Starting setup..."
info "Script directory: $SCRIPT_DIR"
info "Backup directory: $BACKUP_DIR"
echo ""

# Check for required dependencies
echo -e "${BLUE}--- Checking Dependencies ---${NC}"

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    warn "This script is designed for macOS. Some configurations may not work correctly."
fi

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    warn "Homebrew not found. Consider installing it: https://brew.sh"
else
    success "Homebrew found"
fi

# Check for zsh
if [[ "$SHELL" != *"zsh"* ]]; then
    warn "Zsh is not your default shell. Some configurations may not work correctly."
else
    success "Zsh detected"
fi

echo ""
echo -e "${BLUE}--- Deploying Configurations ---${NC}"

# Zsh configuration
info "Setting up Zsh configuration..."
link_config "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
link_config "$SCRIPT_DIR/.zprofile" "$HOME/.zprofile"

# Sheldon configuration
info "Setting up Sheldon configuration..."
link_config "$SCRIPT_DIR/sheldon" "$HOME/.config/sheldon"

# Starship configuration
info "Setting up Starship configuration..."
link_config "$SCRIPT_DIR/starship.toml" "$HOME/.config/starship.toml"

# Tmux configuration
info "Setting up Tmux configuration..."
link_config "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

# SSH configuration
info "Setting up SSH configuration..."
link_config "$SCRIPT_DIR/ssh_config" "$HOME/.ssh/config"

# Alacritty configuration
info "Setting up Alacritty configuration..."
link_config "$SCRIPT_DIR/alacritty" "$HOME/.config/alacritty"

# Ghostty configuration
info "Setting up Ghostty configuration..."
link_config "$SCRIPT_DIR/ghostty" "$HOME/.config/ghostty"

# Aerospace configuration
info "Setting up Aerospace configuration..."
link_config "$SCRIPT_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

# Lazygit configuration
info "Setting up Lazygit configuration..."
link_config "$SCRIPT_DIR/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

# Zed configuration
info "Setting up Zed configuration..."
mkdir -p "$HOME/.config/zed"
for item in "$SCRIPT_DIR/zed"/*; do
    basename_item=$(basename "$item")
    link_config "$item" "$HOME/.config/zed/$basename_item"
done

# Opencode configuration
info "Setting up Opencode configuration..."
link_config "$SCRIPT_DIR/opencode" "$HOME/.config/opencode"

echo ""
echo -e "${BLUE}--- Post-Setup Instructions ---${NC}"

info "Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. For Tmux plugins, start tmux and press: <prefix> + I (capital i)"
echo "  3. Install required tools:"
echo "     - brew install alacritty ghostty lazygit fnm"
echo "     - Install Zed editor: https://zed.dev"
echo "     - Install Aerospace: https://github.com/nikitabobko/AeroSpace"
echo ""

if [[ -d "$BACKUP_DIR" ]]; then
    warn "Existing configurations were backed up to: $BACKUP_DIR"
fi

echo ""
success "Setup completed successfully!"
