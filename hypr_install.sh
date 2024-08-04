#!/bin/bash

# Function to install user preferred packages on Arch Linux
install_packages() {
    sudo pacman -S --needed --noconfirm \
    hyprland \
    hypridle \
    hyprlock \
    xdg-desktop-portal-hyprland \
    wl-clipboard \
    brightnessctl \
    firefox-developer-edition \
    neovim \
    fish \
    wezterm \
    kitty \
    gimp \
    wireplumber \
    qpwgraph \
    nemo \
    nemo-fileroller \
    nemo-terminal \
    tor \
    torbrowser-launcher \
    copyq \
    gimp \
    feh \
    exa \
    fzf \
    vlc \
    ripgrep \
    swaync \
    lazygit \
    btop \
    cmus \
    qt6-base \
    qt6-wayland \
    qt6ct \
    polkit-gnome \
    waybar \
    rofi-wayland \
    ttf-hack-nerd \
    ttf-firacode-nerd \
    otf-font-awesome \
    noto-fonts-emoji \
    starship \
    snapper \
    dart \
    jdk-openjdk \
    clang \
    android-tools \
    virtualbox \
    npm \
    bluez \
    bluez-utils \
    blueman \
    pipewire \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse \
    pipewire-zeroconf \
    wireplumber \

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
        "hyprpicker-git"
        "microsoft-edge-stable-bin"
        "waybar-module-pacman-updates-git"
        "wleave-git"
        "snap-pac-grub"
        "snapper-gui-git"
        "beautyline"
        "sweet-gtk-theme"
        "waypaper-engine"
        "visual-studio-code-bin"
        "flutter"
        "android-studio"
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
    "nvim"
    "fish"
    "wezterm"
    "kitty"
    "wleave"
    "hypr"
    "nwg-drawer"
    "swaync"
    "waybar"
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