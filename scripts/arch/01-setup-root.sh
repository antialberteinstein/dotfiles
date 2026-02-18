#!/bin/bash

# Require running with root or superuser privileges.

# Update system
pacman -Syu --noconfirm

# Install necessary packages
pacman -S --noconfirm git wget curl vim neovim base-devel

# Install Hyprland
pacman -S --noconfirm hyprland

# Install swaylock-effect (AUR)
# Note: AUR packages cannot be installed directly with pacman.
# User should use an AUR helper like yay or paru.
echo "Checking for yay to install AUR packages..."
if command -v yay &> /dev/null; then
    yay -S --noconfirm swaylock-effects-git
else
    echo "Warning: 'yay' not found. Please install 'swaylock-effects-git' manually from AUR."
fi

# Install Wayland supported tools
pacman -S --noconfirm xdg-desktop-portal-hyprland waybar dunst kitty rofi-wayland wl-clipboard sddm hyprpaper

# Change display manager
systemctl disable gdm || true
systemctl enable sddm

# Install misc packages
pacman -S --noconfirm fish btop bat cmatrix

# Install important packages
pacman -S --noconfirm pavucontrol brightnessctl

# Install fonts
pacman -S --noconfirm ttf-fira-code ttf-jetbrains-mono ttf-roboto

# Install lazygit
pacman -S --noconfirm lazygit

# Install for Astro Nvim & other tools
pacman -S --noconfirm ripgrep fd nodejs bluez bluez-utils blueman
# python-pip might be needed
pacman -S --noconfirm python-pip
