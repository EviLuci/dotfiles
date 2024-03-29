#!/bin/bash

# Function to install user preferred packages on Arch Linux
install_packages() {
    sudo pacman -S --needed --noconfirm \
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
    nemo-fileroller \
    nemo-terminal \
    tor \
    torbrowser-launcher \
    copyq \
    telegram-desktop \
    gimp \
    feh \
    exa \
    fzf \
    vlc \
    ripgrep \
    lazygit \
    btop \
    cmus \
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
    snapper \
    dart \
    jdk-openjdk \
    clang \
    android-tools \
    virtualbox \
    
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
        "swaync-git"
        "hyprshot-git"
        "hypridle-git"
        "hyprlock-git"
        "microsoft-edge-stable-bin"
        "rofi-lbonn-wayland"
        "waybar-module-pacman-updates-git"
        "wlogout-git"
        "snap-pac-grub"
        "snapper-gui-git"
        "beautyline"
        "sweet-gtk-theme-dark"
        "azote"
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

echo "Hypr specific installation complete!"

source dotfiles_setup.sh

