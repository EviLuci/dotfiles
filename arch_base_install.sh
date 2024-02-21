#!/bin/bash

# Function to prompt user for password securely
get_password() {
    local prompt="$1"
    local password=""
    while true; do
        read -r -s -p "$prompt: " password
        echo
        read -r -s -p "Confirm $prompt: " confirm_password
        echo
        if [ "$password" = "$confirm_password" ]; then
            break
        else
            echo "Passwords do not match. Please try again."
        fi
    done
    echo "$password"
}

# Arch Linux installation
ln -sf /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
{
    echo "127.0.0.1 localhost"
    echo "::1       localhost"
    echo "127.0.1.1 arch.localdomain arch"
} >> /etc/hosts

# Ask for root password
echo "Please enter the root password:"
root_password=$(get_password "Root password")
echo "root:$root_password" | chpasswd

# Ask for new user details
echo "Please enter the details for the new user:"
new_username=""
while [ -z "$new_username" ]; do
    read -r -p "Username: " new_username
done
new_password=$(get_password "Password")

# Create a new user
useradd -m "$new_username"
echo "$new_username:$new_password" | chpasswd

# Grant sudo privileges to the new user
echo "$new_username ALL=(ALL) ALL" >> /etc/sudoers.d/"$new_username"

# Update pacman.conf
# Uncomment the Color line and add "ILoveCandy" under it
sed -i 's/^#Color/Color\nILoveCandy/' /etc/pacman.conf

# Set ParallelDownloads to 10
sed -i 's/^#ParallelDownloads = 0/ParallelDownloads = 10/' /etc/pacman.conf

# Uncomment VerbosePkgLists
sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf

# Install necessary packages
pacman -S --needed --noconfirm grub efibootmgr networkmanager mesa network-manager-applet wpa_supplicant base-devel linux-headers xdg-user-dirs xdg-utils mtools gvfs bluez bluez-utils pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack rsync reflector sof-firmware os-prober ntfs-3g

# Install Grub bootloader
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# Configure Grub
grub-mkconfig -o /boot/grub/grub.cfg

# Enable necessary services
systemctl enable --now NetworkManager bluetooth reflector.timer reflector.service avahi-daemon

# Update reflector configuration
# Define the list of countries
countries="Bangladesh,India,China,  "

# Check if reflector.conf already contains the countries line
if grep -q "^--country" /etc/xdg/reflector/reflector.conf; then
    # Modify existing line
    sed -i "s/^--country .*/--country '$countries'/" /etc/xdg/reflector/reflector.conf
else
    # Append new line
    echo "--country '$countries'" | sudo tee -a /etc/xdg/reflector/reflector.conf >/dev/null
fi

# Define AUR packages to be installed
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
    # Add more AUR packages as necessary
)

# Function to install user preferred packages on Arch Linux
install_packages() {
    pacman -S \
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
    lazygit \
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

echo "Arch Linux base installation, and dotfiles setup complete!"
