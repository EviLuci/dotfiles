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

source hypr_install.sh

echo "Arch Linux base installation, and dotfiles setup complete!"
