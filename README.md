# Dotfiles (WIP)

This repository contains my personal dotfiles and installation scripts for setting up my Hyprland setup.

## Contents

- [Introduction](#introduction)
- [Preview](#preview)
- [Installation](#installation)
  - [Arch Base Installation](#arch-base-installation)
  - [Hypr Install](#hypr-install)
  - [Dotfiles Setup](#dotfiles-setup)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)

## Introduction

In this repository, you'll find my dotfiles and installation scripts to make it easier to replicate my environment on a new arch system.

⚠️ **Disclaimer**: The dotfiles and scripts provided in this repository are experimental and are intended for my personal use only. If you choose to use them, please be aware that you do so at your own risk. I make no guarantees about the reliability or suitability of these scripts and the configs for any purpose other than my own personal setup. It's completely a newbie setup ,so don't expect everything to work lol 😂😂😂

## Preview

### Desktop

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/desktop.png)

### Neovim

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/neovim.png)

### Rofi

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/rofi.png)

### Waybar

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/waybar.png)

### Sway Notification Daemon

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/swaync1.png)  ![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/swaync2.png)

## Installation

### Necessary dependencies for my hyprland setup

- [Hyprland](https://github.com/vaxerski/Hyprland/) (Hyprland is a dynamic tiling Wayland compositor that doesn't sacrifice on its looks.)
- [waybar](https://github.com/Alexays/Waybar/) (Like polybar, but for wlroots, very customizable)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter) (GNOME like notification daemon, with GUI and all)
- [Rofi-wayland](https://github.com/lbonn/rofi) (Rofi fork with support for wlroots)
- [Hyprshot](https://github.com/Gustash/Hyprshot) (utility to easily take screenshot in Hyprland using your mouse)
- [Wlogout](https://github.com/ArtsyMacaw/wlogout) (Logout menu)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (Command-line copy/paste utilities for Wayland)
- [Azote](https://github.com/nwg-piotr/azote) (GTK3 based wallpaper setter using swaybg)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) (read and control device brightness)
- [waybar-module-pacman-updates](https://github.com/coffebar/waybar-module-pacman-updates) (waybar module for arch to show system updates available)
- [Pipewire](https://github.com/PipeWire/pipewire) (server and user space API to deal with multimedia pipelines)

### Optional packages

- [copyq](https://hluk.github.io/CopyQ/) (CopyQ is an advanced clipboard manager with editing and scripting features.)
- [Kitty](https://github.com/kovidgoyal/kitty) (A cross-platform, fast, feature-full, GPU-based terminal emulator)
- [Wezterm](https://wezfurlong.org/wezterm/) (A GPU-accelerated cross-platform terminal emulator and multiplexer)
- [Fish](https://github.com/fish-shell/fish-shell) (smart and user-friendly command line shell)
- [Starship](https://github.com/starship/starship) (cross-shell prompt)
- FiraCode Nerd Font, Font Awesome (fonts with icons)
- sweet-gtk-theme-dark, beautyline (system and icon themes)

### Cloning the Repository

Before running the installation scripts, clone this repository to your local machine:

```bash
git clone https://github.com/EviLuci/dotfiles.git
```

It is recommended to review the script and understand its actions before executing it.

### Arch Base Installation

The `arch_base_install.sh` script is used to configure and set up everything during Arch Linux installation. It includes system configurations, package installations, bootloader setup, user creation, and initial dotfiles setup.

⚠️ **Warning**: Please use the `arch_base_install.sh` script at your own risk. This script is experimental at the moment and makes system-level changes and is only advisable to be used during fresh arch installation after going through arch installation wiki and entering arch-chroot environment.

To run the Arch base installation script:

```bash
cd dotfiles
chmod +x arch_base_install.sh
cd
./dotfiles/arch_base_install.sh
```

### Hypr Install

The `hypr_install.sh` script installs packages that i use in my personal setup and sets up dotfiles. This script is useful for installing additional packages and configuring dotfiles after a fresh base Arch Linux installation.

To run the Hypr installation script, `cd` into the cloned `dotfiles` directory and then run:

```bash
./hypr_install.sh
```

### Dotfiles Setup

The `dotfiles_setup.sh` script is used solely for setting up dotfiles. It can be used independently of the Arch Linux installation scripts to quickly set up dotfiles on existing systems.

To run the dotfiles setup script, `cd` into the cloned `dotfiles` directory and then run:

```bash
./dotfiles_setup.sh
```

## Usage

These installation scripts are designed to be used on Arch Linux systems. Before running the scripts, make sure to review and customize the configurations according to your preferences. Additionally, ensure that you have backed up any existing configurations that may be overwritten during the installation process.

## Customization

Feel free to customize the dotfiles and installation scripts to better suit your needs. You can modify the configurations, add or remove packages, or extend the scripts to automate additional tasks.

## Contributing

If you have any suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request. Contributions are welcome!
