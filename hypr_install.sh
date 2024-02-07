#!/bin/bash

# Define AUR packages to be installed
AUR_PACKAGES=(
    "swaync-git"
    "hyprshot-git"
    "microsoft-edge-stable-bin"
    "rofi-lbonn-wayland"
    "waybar-module-pacman-updates-git"
    "wlogout-git"
    "snap-pac-grub"
    "snapper-gui-git"
    "beautyline"
    "sweet-gtk-theme-dark"
    "azote"
    # Add more AUR packages as necessary
)

# Function to install user preferred packages on Arch Linux
install_packages() {
    sudo pacman -S \
    hyprland \
    xdg-desktop-portal-hyprland \
    wl-clipboard \
    brightnessctl \
    neovim \
    fish \
    wezterm \
    kitty \
    gimp \
    wireplumber \
    qpwgraph \
    nemo \
    tor \
    torbrowser-launcher \
    copyq \
    telegram-desktop \
    gimp \
    feh \
    exa \
    fzf \
    ripgrep \
    qt6-base \
    qt6-wayland \
    qt6ct \
    polkit-gnome \
    waybar \
    ttf-hack-nerd \
    ttf-firacode-nerd \
    otf-font-awesome \
    noto-fonts-emoji \
    starship \
    snapper
    
    
    # Install AUR helper if not installed
    if ! command -v paru &> /dev/null; then
        echo "Installing paru AUR helper..."
        git clone https://aur.archlinux.org/paru.git /paru
        (cd /tmp/paru && makepkg -si --noconfirm)
        rm -rf /paru
    fi
    
    # Install AUR packages using paru
    echo "Installing AUR packages..."
    paru -S "${AUR_PACKAGES[@]}"
}

# Install packages (if not already installed)
echo "Installing necessary packages..."
install_packages

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

