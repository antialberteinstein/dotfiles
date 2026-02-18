#!/bin/bash

# Require running with root or superuser privileges.

# Install necessary packages
dnf update -y
dnf install -y git wget curl vim neovim

# Install Hyprland
dnf copr enable -y solapasha/hyprland
dnf install -y hyprland

# Install swaylock-effect
dnf copr enable -y eddsalkield/swaylock-effects
dnf install -y swaylock-effects

# Install Wayland supported tools
dnf install -y xdg-desktop-portal-hyprland waybar dunst kitty rofi-wayland wl-clipboard sddm hyprpaper

# Change display manager
systemctl disable gdm
systemctl enable sddm

# Install misc packages
dnf install -y fish btop bat cmatrix

# Install important packages
dnf install -y pavucontrol brightnessctl

# Install fonts
dnf install -y fira-code-fonts jetbrains-mono-fonts google-roboto-fonts

# Install lazygit
dnf copr enable -y atim/lazygit
dnf install -y lazygit

# Install for Astro Nvim & other tools
dnf install -y ripgrep fd-find nodejs bluez bluez-tools blueman
