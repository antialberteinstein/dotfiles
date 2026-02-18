#!/bin/bash

# Ensure flatpak is installed
pacman -S --noconfirm flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub md.obsidian.Obsidian -y
