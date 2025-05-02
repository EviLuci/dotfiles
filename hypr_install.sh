#!/bin/bash

# Function to install user preferred packages on Arch Linux
install_packages() {
    sudo pacman -S --needed --noconfirm \
    hyprland \
    hypridle \
    hyprlock \
    hyprpicker \
    hyprutils \
    waybar \
    rofi-wayland \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    wl-clipboard \
    brightnessctl \
    firefox-developer-edition \
    tor \
    torbrowser-launcher \
    vivaldi \
    neovim \
    zed \
    fish \
    wezterm \
    ghostty \
    yazi \
    copyq \
    gimp \
    exa \
    fzf \
    ripgrep \
    fd \
    zoxide \
    starship \
    swaync \
    lazygit \
    zellij \
    btop \
    grim \
    slurp \
    wf-recorder \
    satty \
    polkit-gnome \
    gimp \
    vlc \
    nemo \
    nemo-fileroller \
    nemo-terminal \
    snapper \
    virtualbox \
    npm \
    bluez \
    bluez-utils \
    blueman \
    networkmanager \
    network-manager-applet \
    pipewire \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse \
    pipewire-zeroconf \
    wireplumber \
    qpwgraph \
    pavucontrol \
    obsidian \
    fortune-mod \
    ttf-hack-nerd \
    ttf-firacode-nerd \
    otf-font-awesome \
    noto-fonts-emoji \
}

# Install AUR packages
install_aur_packages() {
    # Install AUR helper if not installed
    if ! command -v paru &> /dev/null; then
        echo "Installing paru AUR helper..."
        git clone https://aur.archlinux.org/paru.git /paru
        (cd /tmp/paru && makepkg -si --noconfirm)
        rm -rf /paru
    fi

    # AUR packages list
    AUR_PACKAGES=(
        "hyprshot-git"
        "microsoft-edge-dev-bin"
        "waybar-module-pacman-updates-git"
        "snap-pac-grub"
        "beautyline"
        "sweet-gtk-theme"
        "waypaper-git"
        "visual-studio-code-bin"
        "woomer"
        # Add more AUR packages as necessary
    )

    # Install AUR packages using paru
    echo "Installing AUR packages..."
    paru -S --needed --noconfirm "${AUR_PACKAGES[@]}"
}

# Call functions to install packages
echo "Installing necessary packages..."
install_packages
install_aur_packages

echo "Hypr setup installation complete!"

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
    "fish"
    "ghostty"
    "helix"
    "hypr"
    "kitty"
    "nvim"
    "nwg-drawer"
    "rofi"
    "swaync"
    "waybar"
    "wezterm"
    "yazi"
)
CONFIG_FILES=(
    ".vimrc"
    ".bashrc"
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

echo "Dotfiles setup complete!"