#!/bin/bash

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
cp -r waybar/scripts ~/.config/waybar/scripts/
chmod +x ~/.config/waybar/scripts/waybar-wttr.py

sudo pacman -S --noconfirm dolphin kde-cli-tools
yay -S --noconfirm hyprland
yay -S --noconfirm hyprpaper
yay -S --noconfirm waybar
sudo pacman -S --noconfirm rofi

cp hyprland.conf ~/.config/hypr/hyprland.conf
cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css
cp rofi/config.rasi ~/.config/rofi/config.rasi
cp rofi/catppuccin.rasi ~/.config/rofi/catppuccin.rasi

cat > ~/.bash_profile <<EOL
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
exec Hyprland
EOL

sudo reboot

$SHELL



























