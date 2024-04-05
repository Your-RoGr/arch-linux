#!/bin/bash

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/swaylock
mkdir -p ~/.config/swww
mkdir -p ~/.config/Thunar
mkdir -p ~/.config/alacritty
sudo mkdir -p /usr/share/wallpapers

cp -r waybar/scripts ~/.config/waybar/scripts
sudo cp -r wallpapers ~/.config

chmod +x ~/.config/waybar/scripts/waybar-wttr.py

sudo pacman -S --noconfirm kde-cli-tools
yay -S --noconfirm hyprland
yay -S --noconfirm waybar
sudo pacman -S --noconfirm swaylock
yay -S --noconfirm swaylock-effects
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm gvfs
sudo pacman -S --noconfirm thunar thunar-archive-plugin thunar-media-tags-plugin
sudo pacman -S --noconfirm grim slurp wl-clipboard
yay -S --noconfirm swww
yay -S --noconfirm hyprpicker

cp hyprland.conf ~/.config/hypr/hyprland.conf
cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css
cp rofi/config.rasi ~/.config/rofi/config.rasi
cp rofi/catppuccin.rasi ~/.config/rofi/catppuccin.rasi
cp swaylock/config ~/.config/swaylock/config
cp swww/swww-random.sh ~/.config/swww/swww-random.sh
cp Thunar/uca.xml ~/.config/Thunar/uca.xml
cp alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

yay -S --noconfirm breeze-snow-cursor-theme

mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0
mkdir -p ~/.icons/default
sudo mkdir -p /usr/share/icons/default

cp -r /usr/share/icons/Breeze_Snow ~/.icons/Breeze_Snow

cp gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini
cp default/index.theme ~/.icons/default/index.theme
sudo cp default/index.theme /usr/share/icons/default/index.theme

gsettings set org.gnome.desktop.interface cursor-theme Breeze_Snow

cat > ~/.bash_profile << EOL
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
exec Hyprland
EOL

chmod +x gui-apps-installer.sh
chmod +x python-installer.sh
chmod +x games-installer.sh
./gui-apps-installer.sh
./python-installer.sh
./games-installer.sh

sudo reboot
