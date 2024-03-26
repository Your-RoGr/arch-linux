#!/bin/bash

# Enable multilib
echo "Enabling multilib"
sudo sed -i 's/#\[multilib\]/\[multilib\]/g' /etc/pacman.conf
sudo sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

sudo pacman -Sy --noconfirm

# Install ntp
echo "Installing ntp"
sudo pacman -S --noconfirm ntp
sudo systemctl enable ntpd

# Install YAY
echo "Installing YAY"
sudo pacman -S --noconfirm git base-devel wget
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -R -f ~/yay

# Install font
echo "Installing ttf-jetbrains-mono"
sudo pacman -S --noconfirm ttf-jetbrains-mono
fc-cache -fv

# Install alacritty
echo "Installing alacritty"
sudo pacman -S --noconfirm alacritty

# sudo pacman -S clang base-devel gdb ninja gcc cmake libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland cmake wlroots mesa git meson polkit 

sudo reboot

$SHELL

# Install xorg
# echo "Installing xorg"
# sudo pacman -S --noconfirm xorg xorg-init xorg-server

# Post-installation configuration
# Enable dhcpcd
# echo "Enabling dhcpcd"
# sudo systemctl enable dhcpcd

# Install alsa
# echo "Installing alsa"
# sudo pacman -S --noconfirm alsa-lib alsa-plugins alsa-tools alsa-utils

# Configure keyboard layout for X11
# echo "Configuring keyboard layout for X11"
# cat > /etc/X11/xorg.conf.d/00-keyboard.conf << EOF
# Section "InputClass"
#     Identifier "system-keyboard"
#     MatchIsKeyboard "on"
#     Option "XkbLayout" "us,ru"
#     Option "XkbModel" "pc105"
#     Option "XkbOptions" "grp:alt_shift_toggle"
# EndSection
# EOF

# Install fish
# echo "Installing fish"
# sudo pacman -S --noconfirm fish
# fish
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# fisher install jorgebucaran/nvm.fish
# fisher install IlanCosman/tide@v5
# chsh -s /usr/bin/fish
# set -U fish_greeting