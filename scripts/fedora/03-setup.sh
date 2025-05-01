#!/bin/bash

# Copying waybar config
mkdir -p ~/.config/waybar
cp /etc/xdg/waybar/* ~/.config/waybar/

# Install nerd fonts.
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm -rf *.zip
rm -rf *.md
rm -rf *.olf
fc-cache -fv
cd -


# Install candy icons
mkdir -p ~/.icons
cd ~/.icons
git clone https://github.com/EliverLara/candy-icons.git
cd -

# Install sweet theme
mkdir -p ~/.themes
cd ~/.themes
git clone https://github.com/EliverLara/Sweet.git
cd -


