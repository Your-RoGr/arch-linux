#!/bin/bash

sudo rm -rf /local

sudo pacman -Syu
sudo pacman -Sy --noconfirm intel-media-driver
sudo pacman -Sy --noconfirm libva-intel-driver
sudo pacman -Sy --noconfirm libva-intel-driver libva-mesa-driver mesa-vdpau

echo "Enter your GPU manufacturer [1 - nvidia (For GTX 750 and newer), 2 - amd or skip] (press enter for default: 1):"
read vendor
vendor=$(echo $vendor | tr -cd '[:alnum:]_-')
vendor=${vendor:-1}
echo "You entered: $vendor"

if [[ "${vendor:0:4}" == "skip" ]]; then
    echo "Driver installing skipped"
elif [[ $vendor =~ ^[0-9]+$ ]]; then
    if [ "$vendor" -eq 1 ]; then
        echo "Installing Nvidia drivers..."
        sudo pacman -Sy --noconfirm nvidia nvidia-utils nvidia-settings lib32-nvidia-utils nvtop
        # Enable the nvidia service
        sudo systemctl enable nvidia-persistenced.service
    elif [ "$vendor" -eq 2 ]; then
        echo "Installing AMD drivers..."
        sudo pacman -Sy --noconfirm xf86-video-amdgpu mesa mesa-demos vulkan-icd-loader lib32-mesa lib32-vulkan-icd-loader
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

sudo pacman -Syu --noconfirm

# Install ntp
echo "Installing ntp"
sudo pacman -Sy --noconfirm ntp
sudo systemctl enable ntpd

# Install YAY
echo "Installing git, base-devel, wget and YAY"
sudo pacman -Sy --noconfirm git base-devel wget
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -R -f ~/yay

# Install Japanese tools
sudo pacman -Sy --noconfirm fcitx fcitx-qt5 fcitx-im fcitx-configtool
sudo pacman -Sy --noconfirm fcitx-mozc fcitx-anthy

mkdir -p ~/.config/fcitx
cp fcitx/config ~/.config/fcitx/config

# Install font
echo "Installing fonts"
sudo pacman -Sy --noconfirm ttf-jetbrains-mono ttf-roboto
yay -Sy --noconfirm ttf-ms-fonts ttf-vista-fonts ttf-paratype
yay -Sy --noconfirm noto-color-emoji-fontconfig
sudo pacman -Sy --noconfirm adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts noto-fonts-cjk
fc-cache -fv

# Install alacritty
echo "Installing alacritty"
sudo pacman -Sy --noconfirm alacritty

# install xdg
echo "Installing xdg"
sudo pacman -Sy --noconfirm xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-utils kde-cli-tools

# install flatpak
#echo "Installing flatpak"
#sudo pacman -Sy --noconfirm flatpak
#sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install other soft
echo "Installing clang, gdb, ninja, gcc, cmake, fastfetch, htop, bashtop, fish, lf, neovim"
sudo pacman -Sy --noconfirm clang gdb ninja gcc cmake fastfetch htop bashtop fish lf neovim
set -U fish_greeting

sudo systemctl enable systemd-homed
sudo systemctl start systemd-homed

echo "Installing brightnessctl"
sudo pacman -Sy --noconfirm brightnessctl

echo "Installing iwgtk"
yay -Sy --noconfirm iwgtk

echo "Installing cpupower-gui-git"
yay -Sy --noconfirm cpupower-gui-git

echo "Installing python package"
sudo pacman -Sy --noconfirm python-requests

echo "Installing audio drivers: pipewire/alsa"
sudo pacman -Sy --noconfirm alsa-lib alsa-plugins alsa-tools alsa-utils
sudo pacman -Sy --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack pipewire-audio pavucontrol bluez bluez-utils blueberry
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# For screencast
echo "Installing xdg-desktop-portal-hyprland"
sudo pacman -Sy --noconfirm xdg-desktop-portal-hyprland
sudo pacman -Sy --noconfirm xdg-desktop-portal-wlr

echo "Do you need an app for logitech, asus-rog, steelseries and other gaming mice? (press enter for default: [yes])"
read mice_app
mice_app=${mice_app:-yes}

if [[ "${mice_app}" == "yes" ]]; then
    echo "Installing piper"
    sudo pacman -Sy --noconfirm piper

    cat << EOL | sudo tee /usr/share/libratbag/logitech-g102-g203.device > /dev/null
# G102, G103 and G203 (USB)
[Device]
Name=Logitech Gaming Mouse G102/G103/G203
DeviceMatch=usb:046d:c084;usb:046d:c092;usb:046d:c09d
Driver=hidpp20
LedTypes=logo;side;
DeviceType=mouse
EOL
fi

chmod +x hyprland-installer.sh
./hyprland-installer.sh

$SHELL