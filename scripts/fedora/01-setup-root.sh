#!/bin/bash

# Require running with root or superuser privileges.

# Install necessary packages
dnf update -y
dnf install git wget curl vim neovim -y

# Install Hyprland
dnf install copr enable solapasha/hyprland -y
dnf install hyprland -y

# Install swaylock-effect
dnf copr enable eddsalkield/swaylock-effects
dnf install swaylock-effects

# Install Wayland supported tools
dnf install xdg-desktop-portal-hyprland waybar dunst kitty rofi-wayland wl-clipboard sddm hyprpaper -y

# Change display manager
systemctl disable gdm
systemctl enable sddm

# Install some packages
dnf install fish -y
dnf install btop -y
dnf install bat -y
dnf install cmatrix -y

# Install important packages
dnf install pavucontrol -y
dnf install brightnessctl -y

# Install fonts
dnf install fira-code-fonts jetbrains-mono-fonts google-roboto-fonts -y

# Install lazygit
dnf copr enable atim/lazygit -y
dnf install lazygit -y

# Install for Astro Nvim
dnf install -y git neovim ripgrep fd-find
dnf install -y nodejs

dnf install bluez bluez-tools blueman
