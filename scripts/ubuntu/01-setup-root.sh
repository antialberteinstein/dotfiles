#!/bin/bash

# Require running with root or superuser privileges.

# Update and upgrade
apt update && apt upgrade -y

# Install necessary packages
apt install -y git wget curl vim neovim build-essential

# Install Hyprland
# Hyprland on Ubuntu is not straightforward. 
# It is recommended to check https://github.com/hyprwm/Hyprland for Ubuntu installation instructions or use a helper script.
echo "Warning: Hyprland installation on Ubuntu is complex. Please install it manually or use a reputable install script."
# Attempting to install if available in widely used PPA or future repos:
# add-apt-repository ppa:hyprland-community/hyprland -y
# apt update
# apt install -y hyprland

# Install Wayland supported tools
# Note: Some package names might differ or require specific PPAs on older Ubuntu versions.
apt install -y waybar dunst kitty rofi wl-clipboard sddm hyprpaper

# Change display manager
systemctl disable gdm
systemctl enable sddm

# Install misc packages
apt install -y fish btop bat
# cmatrix might be in universe

# Install important packages
apt install -y pavucontrol brightnessctl

# Install fonts
apt install -y fonts-firacode fonts-jetbrains-mono fonts-roboto

# Install lazygit
add-apt-repository ppa:lazygit-team/release -y
apt update
apt install -y lazygit

# Install for Astro Nvim & other tools
apt install -y ripgrep fd-find nodejs 
ln -s $(which fdfind) /usr/local/bin/fd

# Bluetooth
apt install -y bluez blueman
