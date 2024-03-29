#!/bin/bash

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
sudo mkdir -p /usr/share/wallpapers

cp -r waybar/scripts ~/.config/waybar/scripts/
sudo cp -r wallpapers ~/.config

chmod +x ~/.config/waybar/scripts/waybar-wttr.py

sudo pacman -S --noconfirm kde-cli-tools
yay -S --noconfirm hyprland
yay -S --noconfirm waybar
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm thunar thunar-archive-plugin thunar-media-tags-plugin
yay -S --noconfirm swww

cp hyprland.conf ~/.config/hypr/hyprland.conf
cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css
cp rofi/config.rasi ~/.config/rofi/config.rasi
cp rofi/catppuccin.rasi ~/.config/rofi/catppuccin.rasi

cat > ~/.bash_profile << EOL
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
exec Hyprland
EOL

sudo reboot

$SHELL



























