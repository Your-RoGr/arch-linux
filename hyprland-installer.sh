#!/bin/bash

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
cp -r scripts ~/.config/waybar/scripts/

sudo pacman -S --noconfirm dolphin kde-cli-tools
yay -S --noconfirm hyprland
yay -S --noconfirm hyprpaper
yay -S --noconfirm waybar
yay -S --noconfirm wofi

cp hyprland.conf ~/.config/hypr/hyprland.conf
cp config ~/.config/waybar/config
cp style.css ~/.config/waybar/style.css

sudo reboot

# micro nano ~/.bash_profile
# exec Hyprland

$SHELL



























