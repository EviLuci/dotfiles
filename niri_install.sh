#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Define the dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# ───────────────────────────────────────────────────────────
# 1. Packages
# ───────────────────────────────────────────────────────────

# Essential Niri & system packages
Niri_ESSENTIALS_PACKAGES=(
    niri hypridle hyprlock hyprpicker xdg-desktop-portal-gtk xdg-desktop-portal-gnome polkit-gnome gnome-keyring
    pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-zeroconf wireplumber qpwgraph pavucontrol
    waybar swaync bluez bluez-utils blueman networkmanager network-manager-applet brightnessctl  fuzzel
    wl-clipboard grim slurp
    ttf-firacode-nerd otf-font-awesome noto-fonts-emoji
)
# AUR Essential packages
AUR_ESSENTIAL_PACKAGES=(
    waybar-module-pacman-updates-git beautyline
)

# Personal packages
PERSONAL_PACKAGES=(
    firefox-developer-edition
    neovim zed obsidian helix
    copyq satty kooha
    ghostty
    fish exa fzf ripgrep zoxide starship lazygit zellij btop
    yazi 7zip jq resvg fd imagemagick poppler
    vlc
    snapper
    virtualbox
    npm
)

# AUR Personal packages
AUR_PERSONAL_PACKAGES=(
    brave-bin waypaper-git
)

# ───────────────────────────────────────────────────────────
# 2. Helpers
# ───────────────────────────────────────────────────────────

# Prompt user to choose AUR helper
choose_aur_helper() {
    echo "Select AUR helper to install:"
    select helper in "paru" "yay"; do
        if [[ -n "$helper" ]]; then
            AUR_HELPER="$helper"
            break
        else
            echo "Invalid choice. Please select 1 or 2."
        fi
        echo
    done
}

# Install AUR helper
install_aur_helper() {
    # Check if AUR helper is already installed
    if ! command -v "$AUR_HELPER" &> /dev/null; then
        echo "Installing AUR helper: $AUR_HELPER"
        local tmp_dir
        tmp_dir=$(mktemp -d)
        git clone "https://aur.archlinux.org/$AUR_HELPER.git" "$tmp_dir/$AUR_HELPER"
        pushd "$tmp_dir/$AUR_HELPER" > /dev/null
            makepkg -si --noconfirm
        popd > /dev/null
        rm -rf "$tmp_dir/$AUR_HELPER"
    else
        echo "$AUR_HELPER is already installed."
    fi
    echo
}

# Install necessary packages to run a functional Niri setup
install_essential_Niri_packages() {
    echo "Installing essential Niri packages..."
    sudo pacman -Syu --needed --noconfirm "${Niri_ESSENTIALS_PACKAGES[@]}"
    echo
}

# Install additional personal preferred packages for a more complete setup
install_personal_packages() {
    echo "Installing personal packages..."
    sudo pacman -Syu --needed --noconfirm "${PERSONAL_PACKAGES[@]}"
    echo
}

install_aur_essential_Niri_packages() {
    echo "Installing AUR essential packages..."
    "$AUR_HELPER" -S --needed --noconfirm "${AUR_ESSENTIAL_PACKAGES[@]}"
    echo
}

install_aur_personal_packages() {
    echo "Installing AUR personal packages..."
    "$AUR_HELPER" -S --needed --noconfirm "${AUR_PERSONAL_PACKAGES[@]}"
    echo
}

# Dotfiles setup

# Define the directories and files to be installed
CONFIG_DIRS=(
    "fish"
    "ghostty"
    "helix"
    "hypr"
    "kitty"
    "nvim"
    "rofi"
    "swaync"
    "waybar"
    "wezterm"
    "yazi"
    "zellij"
)

CONFIG_FILES=(
    ".vimrc"
    ".bashrc"
)

# Backup and create symlinks for dotfiles
backup_and_link() {
    local source="$1" destination="$2"
    if [ -e "$destination" ] || [ -L "$destination" ]; then
        echo "Backing up existing $destination to $BACKUP_DIR/"
        mv "$destination" "$BACKUP_DIR/"
        echo "Backup created: $BACKUP_DIR/$(basename "$destination")"
        echo
    fi
    # Create symlink for the dotfile
    echo "Creating symlink for $source to $destination"
    ln -sf "$source" "$destination"
    echo "Symlink created: $source -> $destination"
    echo
}

# Setup dotfiles
setup_dotfiles() {
    echo "Setting up dotfiles..."
    for dir in "${CONFIG_DIRS[@]}"; do
        # Create symlink for each config directory
        backup_and_link "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
    done
    echo
    for file in "${CONFIG_FILES[@]}"; do
        # Create symlink for each config file
        backup_and_link "$DOTFILES_DIR/$file" "$HOME/$file"
    done
    echo
}

# Prompt user for yes/no confirmation
confirm() {
    local prompt="$1" default="${2:-y}" response

    while true; do
        read -r -p "$prompt [y/n]: " response
        # Default to 'y' if no response is given
        if [[ -z "$response" ]]; then
            response="$default"
        fi
        # Convert response to lowercase
        response=${response,,}
        case "$response" in
            y|yes) return 0 ;;
            n|no) return 1 ;;
            *) echo "Invalid response. Please answer 'y' or 'n'." ;;
        esac
    done
}

# Main function
main() {
    echo "Starting Niri installation script..."
    echo

    # Choose AUR helper
    echo "Some packages require an AUR helper. Please choose one."
    echo

    if confirm "Do you want to install an AUR helper?" "y"; then
        choose_aur_helper
        install_aur_helper
    else
        echo "Skipping AUR helper installation."
    fi
    echo

    # Install Niri packages
    if confirm "Do you want to install essential Niri packages?" "y"; then
        install_essential_Niri_packages
        if confirm "Do you want to install personal packages?" "y"; then
            install_personal_packages
        else
            echo "Skipping personal packages installation."
        fi
    else
        echo "Skipping essential Niri packages installation."
    fi
    echo

    # Install AUR packages
    if confirm "Do you want to install AUR essential packages?" "y"; then
        choose_aur_helper
        install_aur_helper
        install_aur_essential_Niri_packages

        if confirm "Do you want to install AUR personal packages?" "y"; then
            install_aur_personal_packages
        else
            echo "Skipping AUR personal packages installation."
        fi
        echo
    else
        echo "Skipping AUR essential packages installation."
    fi
    echo

    # Setup dotfiles
    if confirm "Do you want to set up dotfiles?" "y"; then
        TIMESTAMP=$(date +%Y%m%d%H%M%S)
        BACKUP_DIR="$HOME/old_config_$TIMESTAMP"
        mkdir -p "$BACKUP_DIR"
        setup_dotfiles
    else
        echo "Skipping dotfiles setup."
    fi
    echo

    echo "Niri installation script completed."

}

# Run the main function
main "$@"
