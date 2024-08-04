# Dotfiles (WIP)

This repository contains my personal dotfiles and installation scripts for setting up my Hyprland environment on Arch Linux.

## Contents

- [Introduction](#introduction)
- [Preview](#preview)
- [Installation](#installation)
  - [Arch Base Installation](#arch-base-installation)
  - [Hypr Install](#hypr-install)
  - [Dotfiles Setup](#dotfiles-setup)
- [Usage](#usage)

## Introduction

Welcome to my dotfiles repository! This collection contains my personal configuration files and scripts for setting up a customized Hyprland environment on Arch Linux. The aim is to streamline the process of replicating my setup on new systems.

⚠️ **Disclaimer**: These dotfiles and scripts are experimental and intended for personal use only. Use them at your own risk. I make no guarantees about their reliability or suitability for any purpose other than my own. This is a newbie setup, so expect some rough edges. 😂

## Preview

### Desktop

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/desktop.png)

### Neovim

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/nvim.png)

### nwg-drawer

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/nwg-drawer.png)

### Waybar

Top Bar
![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/top-bar.png)

Bottom Bar
![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/bottom-bar.png)

### Sway Notification Daemon

![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/swaync.png)  ![image](https://github.com/EviLuci/dotfiles/blob/main/screenshots/swaync_menu.png)

## Installation

### Necessary dependencies

- [Hyprland](https://github.com/vaxerski/Hyprland/) (Hyprland is a dynamic tiling Wayland compositor that doesn't sacrifice on its looks.)
- [waybar](https://github.com/Alexays/Waybar/) (Like polybar, but for wlroots, very customizable)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter) (GNOME like notification daemon, with GUI and all)
- [Nwg-drawer](https://github.com/nwg-piotr/nwg-drawer) (Application drawer for wlroots-based Wayland compositors )
- [Hyprshot](https://github.com/Gustash/Hyprshot) (utility to easily take screenshot in Hyprland using your mouse)
- [Wlogout](https://github.com/ArtsyMacaw/wlogout) (Logout menu)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (Command-line copy/paste utilities for Wayland)
- [waypaper-engine](https://github.com/0bCdian/Waypaper-Engine) (A wallpaper setter gui, developed with ricing in mind! 🍚, using swww)
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

Clone this repository to your local machine:

```bash
git clone https://github.com/EviLuci/dotfiles.git
```

Review the scripts and understand their actions before executing them.

### Arch Base Installation

The arch_base_install.sh script configures and sets up everything during an Arch Linux installation, including system configurations, package installations, bootloader setup, user creation, and initial dotfiles setup.

⚠️ **Warning**: Use the arch_base_install.sh script at your own risk. This script is experimental and makes system-level changes. It is advisable to use it only during a fresh Arch installation after following the Arch installation wiki and entering the arch-chroot environment.

To run the Arch base installation script:

```bash
cd dotfiles
chmod +x arch_base_install.sh
cd
./dotfiles/arch_base_install.sh
```

### Hypr Install

The hypr_install.sh script installs packages used in my setup and sets up dotfiles. This script is useful for installing additional packages and configuring dotfiles after a fresh base Arch Linux installation.

To run the Hypr installation script:

```bash
cd dotfiles
./hypr_install.sh
```

### Dotfiles Setup

The dotfiles_setup.sh script is used solely for setting up dotfiles. It can be used independently of the Arch Linux installation scripts to quickly set up dotfiles on existing systems.

To run the dotfiles setup script:

```bash
cd dotfiles
./dotfiles_setup.sh
```

## Usage

These installation scripts are designed for Arch Linux systems. Before running the scripts, review and customize the configurations according to your preferences. Ensure you have backed up any existing configurations that may be overwritten during the installation process.
