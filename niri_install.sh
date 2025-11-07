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
    waybar swaync bluez bluez-utils blueman networkmanager network-manager-applet brightnessctl fuzzel
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
    copyq satty kooha swww
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

# Install paru if not present
install_paru() {
    if command -v paru &> /dev/null; then
        echo "paru is already installed."
        return 0
    fi

    echo "Installing paru (AUR helper)..."
    sudo pacman -Sy --needed --noconfirm base-devel git

    local tmp_dir
    tmp_dir=$(mktemp -d)
    git clone "https://aur.archlinux.org/paru.git" "$tmp_dir/paru"
    pushd "$tmp_dir/paru" > /dev/null
        makepkg -si --noconfirm
    popd > /dev/null
    rm -rf "$tmp_dir"
    echo "paru installed successfully."
    echo
}

# Prompt user for yes/no confirmation
confirm() {
    local prompt="$1" default="${2:-y}" response

    while true; do
        read -r -p "$prompt [y/n]: " response
        if [[ -z "$response" ]]; then
            response="$default"
        fi
        response=${response,,}
        case "$response" in
            y|yes) return 0 ;;
            n|no) return 1 ;;
            *) echo "Invalid response. Please answer 'y' or 'n'." ;;
        esac
    done
}

# Install essential Niri packages
install_essential_Niri_packages() {
    echo "Installing essential Niri packages..."
    sudo pacman -Sy "${Niri_ESSENTIALS_PACKAGES[@]}"
    echo
}

# Install personal packages
install_personal_packages() {
    echo "Installing personal packages..."
    sudo pacman -Sy "${PERSONAL_PACKAGES[@]}"
    echo
}

# Install AUR essential packages
install_aur_essential_packages() {
    echo "Installing AUR essential packages..."
    paru -S "${AUR_ESSENTIAL_PACKAGES[@]}"
    echo
}

# Install AUR personal packages
install_aur_personal_packages() {
    echo "Installing AUR personal packages..."
    paru -S "${AUR_PERSONAL_PACKAGES[@]}"
    echo
}

# Dotfiles setup

CONFIG_DIRS=(
    "cosmic"
    "fish"
    "fuzzel"
    "ghostty"
    "helix"
    "niri"
    "nvim"
    "swaync"
    "systemd"
    "waybar"
    "xdg-desktop-portal"
    "yazi"
    "zellij"
    "code-flags.conf"
    "electron-flags.conf"
)

CONFIG_FILES=(
    ".vimrc"
    ".bashrc"
)

backup_and_link() {
    local source="$1" destination="$2"
    if [ -e "$destination" ] || [ -L "$destination" ]; then
        echo "Backing up existing $destination to $BACKUP_DIR/"
        # Preserve symlinks with -P
        cp -rLP "$destination" "$BACKUP_DIR/"
        rm -rf "$destination"
        echo "Backup created: $BACKUP_DIR/$(basename "$destination")"
        echo
    fi
    ln -sf "$source" "$destination"
    echo "Symlink created: $source -> $destination"
    echo
}

setup_dotfiles() {
    echo "Setting up dotfiles..."
    for dir in "${CONFIG_DIRS[@]}"; do
        backup_and_link "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
    done
    for file in "${CONFIG_FILES[@]}"; do
        backup_and_link "$DOTFILES_DIR/$file" "$HOME/$file"
    done
    echo
}

# ───────────────────────────────────────────────────────────
# 3. Main
# ───────────────────────────────────────────────────────────

main() {
    echo "Starting Niri reconfiguration script..."
    echo

    # Install essential system packages
    if confirm "Install essential Niri packages?" "y"; then
        install_essential_Niri_packages
        if confirm "Install personal packages?" "y"; then
            install_personal_packages
        fi
    fi

    # AUR packages
    if confirm "Install AUR packages?" "y"; then
        install_paru
        install_aur_essential_packages
        if confirm "Install AUR personal packages?" "y"; then
            install_aur_personal_packages
        fi
    fi

    # Dotfiles
    if confirm "Set up dotfiles?" "y"; then
        TIMESTAMP=$(date +%Y%m%d%H%M%S)
        BACKUP_DIR="$HOME/old_config_$TIMESTAMP"
        mkdir -p "$BACKUP_DIR"
        setup_dotfiles
    fi

    echo
    echo "Niri reconfiguration script completed."
}

main "$@"
