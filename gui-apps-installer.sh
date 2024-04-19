#!/bin/bash

# flatpak gui app's 

mkdir -p ~/.config/Downloads

# --------------------------------------------------------------------------
# Audio & Video & Image
# --------------------------------------------------------------------------

# VLC media player, the open-source multimedia player
# VLC is potentially unsafe

echo "Installing VLC"
sudo pacman -Sy --noconfirm vlc

# Live stream and record videos
# OBS Studio is potentially unsafe

echo "Installing OBS Studio"
sudo pacman -Sy --noconfirm obs-studio

# Vector Graphics Editor
# Inkscape is potentially unsafe

echo "Installing Inkscape"
sudo pacman -Sy --noconfirm inkscape

# Free and open source 3D creation suite
# Blender is potentially unsafe

echo "Installing Blender"
sudo pacman -Sy --noconfirm blender

# Digital Painting, Creative Freedom

echo "Installing krita"
sudo pacman -Sy --noconfirm krita

# Image viewer

echo "Installing Eye of GNOME"
sudo pacman -Sy --noconfirm eog

echo "Installing imv"
sudo pacman -Sy --noconfirm imv

# --------------------------------------------------------------------------
# Docs
# --------------------------------------------------------------------------

# For pdf
# LibreOffice is potentially unsafe

echo "Installing LibreOffice"
sudo pacman -Sy --noconfirm libreoffice-still-ru

# Office productivity suite
# ONLYOFFICE Desktop Editors is potentially unsafe

echo "Installing ONLYOFFICE"
yay -Sy --noconfirm onlyoffice-bin
#sudo flatpak install -y flathub org.onlyoffice.desktopeditors

# for other docs (.txt, .py ...)

echo "Installing cudatext-qt5-bin"
yay -Sy --noconfirm cudatext-qt5-bin

#mkdir -p ~/.config/cudatext/settings
#mkdir -p ~/.config/cudatext/settings_default
#cp cudatext/settings/user.json ~/.config/cudatext/settings/user.json
#cp cudatext/settings_default/default.json ~/.config/cudatext/settings_default/default.json

# --------------------------------------------------------------------------
# Developer Tools
# --------------------------------------------------------------------------

# Docker with GUI

echo "Installing Docker desktop"
yay -Sy --noconfirm docker-desktop

# PostgreSQL

sudo pacman -Sy --noconfirm postgresql
sudo -u postgres initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo su - postgres
psql -c "alter user postgres with password 'postgres'"
exit

# PostgreSQL client
yay -Sy --noconfirm postbird-bin

# Platform for building and using APIs
# Postman is potentially unsafe

echo "Installing Postman"
yay -Sy --noconfirm postman-bin
#sudo flatpak install -y flathub com.getpostman.Postman

# DB Browser for SQLite is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite.
# DB Browser for SQLite is potentially unsafe

echo "Installing DB Browser for SQLite"
sudo pacman -Sy --noconfirm sqlitebrowser

# Community Python IDE

echo "Installing Pycharm Community Edition"
sudo pacman -Sy --noconfirm pycharm-community-edition

# The most intelligent Python IDE
# PyCharm-Professional is potentially unsafe

echo "Installing PyCharm-Professional"
yay -Sy --noconfirm pycharm-professional
#sudo flatpak install -y flathub com.jetbrains.PyCharm-Professional

# GoLand is a cross-platform IDE built specially for Go developers
# GoLand is potentially unsafe

echo "Installing GoLand"
yay -Sy --noconfirm goland
#sudo flatpak install -y flathub com.jetbrains.GoLand

# A cross-platform IDE for C and C++
# CLion is potentially unsafe

echo "Installing CLion"
yay -Sy --noconfirm clion
#sudo flatpak install -y flathub com.jetbrains.CLion

# Figma

echo "Installing figma-linux"
yay -Sy --noconfirm figma-linux

# Easily create 2D and 3D games
# Godot Engine is potentially unsafe

echo "Installing Godot Engine"
sudo pacman -Sy --noconfirm godot
#sudo flatpak install -y flathub org.godotengine.Godot

# Godot (C#/.NET) is potentially unsafe

echo "Installing Godot (C#/.NET)"
yay -Sy --noconfirm godot-mono-bin
#sudo flatpak install -y flathub org.godotengine.GodotSharp

## Open-source electronics prototyping platform
## Arduino IDE v2 is potentially unsafe
#
#echo "Installing Arduino IDE v2"
#yay -Sy --noconfirm arduino-ide-bin
##sudo flatpak install -y flathub cc.arduino.IDE2

# --------------------------------------------------------------------------
# Networking
# --------------------------------------------------------------------------

# Discord desktop app via browser

echo "Installing WebCord"
yay -S --noconfirm webcord

# Telegram

echo "Installing telegram-desktop"
sudo pacman -Sy --noconfirm telegram-desktop

# The web browser from Yandex
# Yandex Browser is potentially unsafe

echo "Installing Yandex Browser"
yay -Sy --noconfirm yandex-browser
#sudo flatpak install -y flathub ru.yandex.Browser

echo "Installing Google Chrome"
yay -Sy --noconfirm google-chrome

echo "Installing Firefox"
sudo pacman -Sy --noconfirm firefox

# Thunderbird is a free and open source email, newsfeed, chat, and calendaring client
# Thunderbird is potentially unsafe

#echo "Installing Thunderbird"
#sudo pacman -Sy --noconfirm thunderbird
#sudo flatpak install -y flathub org.mozilla.Thunderbird

# --------------------------------------------------------------------------
# Utilities
# --------------------------------------------------------------------------

# Markdown-based knowledge base
# Obsidian is potentially unsafe

echo "Installing Obsidian"
sudo pacman -Sy --noconfirm obsidian
#sudo flatpak install -y flathub md.obsidian.Obsidian

# Read e-books

echo "Installing evince"
sudo pacman -Sy --noconfirm evince

# Fast and reliable FTP client
# FileZilla is potentially unsafe

echo "Installing FileZilla"
sudo pacman -Sy --noconfirm filezilla
#sudo flatpak install -y flathub org.filezillaproject.Filezilla

# --------------------------------------------------------------------------
# Entertainments 
# --------------------------------------------------------------------------

## A cross-platform downloader for manga and anime from various websites
## HakuNeko is potentially unsafe
#
#echo "Installing HakuNeko"
#yay -Sy --noconfirm hakuneko-desktop-bin
##sudo flatpak install -y flathub io.github.hakuneko.HakuNeko

# --------------------------------------------------------------------------
# Science
# --------------------------------------------------------------------------

## Molecular visualization and raytracing
## Python Molecular Graphics is potentially unsafe
#
#echo "Installing Python Molecular Graphics"
#sudo flatpak install -y flathub org.pymol.PyMOL

## A Realtime Satellite Orbit Visualizer
## OrbVis is probably safe
#
#echo "Installing OrbVis"
#sudo flatpak install -y flathub io.github.wojciech_graj.OrbVis

# --------------------------------------------------------------------------
# Install other gui app's 
# --------------------------------------------------------------------------

echo "Installing gnome-clocks"
sudo pacman -Sy --noconfirm gnome-clocks
