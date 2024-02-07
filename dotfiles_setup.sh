#!/bin/bash

# Dotfiles setup
# Define the dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Function to backup existing directory
backup_directory() {
    local dir="$1"
    local backup_dir
    backup_dir="${dir}.backup_$(date +%Y%m%d%H%M%S)"
    if [ -d "$dir" ]; then
        echo "Backing up existing directory $dir to $backup_dir"
        mv "$dir" "$backup_dir"
    fi
}

# Define the directories and files to be installed
CONFIG_DIRS=(
    "nvim"
    "fish"
    "wezterm"
    "kitty"
    "wlogout"
    "hypr"
    "rofi"
    "swaync"
    "waybar"
)
CONFIG_FILES=(
    ".vimrc"
)

# Backup existing configuration directories
for dir in "${CONFIG_DIRS[@]}"; do
    backup_directory "$HOME/.config/$dir"
done

# Backup existing individual files
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
        echo "Backing up existing $file to $HOME/${file}.bak"
        mv "$HOME/$file" "$HOME/${file}.bak"
    fi
done

# Install .config directories
for dir in "${CONFIG_DIRS[@]}"; do
    # Create symlink to .config directory
    echo "Creating symlink for .config/$dir"
    ln -s "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
done

# Install individual files
for file in "${CONFIG_FILES[@]}"; do
    # Create symlink to file
    echo "Creating symlink for $file"
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done
