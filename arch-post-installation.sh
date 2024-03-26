#!/bin/bash

echo "Enter your GPU manufacturer [1 - nvidia, 2 - amd] (press enter for default: 1):"
read vendor
vendor=$(echo $vendor | tr -cd '[:alnum:]_-')
vendor=${vendor:-1}
echo "You entered: $vendor"

# Check if the user entered a number
if [[ $vendor =~ ^[0-9]+$ ]]; then
    if [ "$vendor" -eq 1 ]; then
        echo "Installing Nvidia drivers..."
        sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
        # Enable the nvidia service
        sudo systemctl enable nvidia-persistenced.service
    elif [ "$vendor" -eq 2 ]; then
        echo "Installing AMD drivers..."
        sudo pacman -S --noconfirm xf86-video-amdgpu mesa mesa-demos vulkan-icd-loader lib32-mesa lib32-vulkan-icd-loader
        # Enable the amdgpu service (if necessary)
        sudo systemctl enable amdgpu-init.service
    else
        echo "Invalid entry. Please enter either 1 or 2."
    fi
else
    echo "Invalid entry. Please enter either 1 or 2."
fi

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

# install flatpak 
echo "Installing flatpak"
sudo pacman -S --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install other soft
echo "Installing git, clang, base-devel, gdb, ninja, gcc, cmake"
sudo pacman -S --noconfirm git clang base-devel gdb ninja gcc cmake

sudo reboot

$SHELL