#!/bin/bash

# flatpak gui app's 

mkdir -p ~/.config/Downloads

# --------------------------------------------------------------------------
# Audio & Video & Image
# --------------------------------------------------------------------------

# VLC media player, the open-source multimedia player
# VLC is potentially unsafe

echo "Installing VLC"
sudo pacman -S --noconfirm vlc

# Live stream and record videos
# OBS Studio is potentially unsafe

echo "Installing OBS Studio"
sudo pacman -S --noconfirm obs-studio

# Vector Graphics Editor
# Inkscape is potentially unsafe

echo "Installing Inkscape"
sudo pacman -S --noconfirm inkscape

# Free and open source 3D creation suite
# Blender is potentially unsafe

echo "Installing Blender"
sudo pacman -S --noconfirm blender

# Digital Painting, Creative Freedom

echo "Installing krita"
sudo pacman -S --noconfirm krita

# Image viewer

echo "Installing Eye of GNOME"
sudo pacman -S --noconfirm eog

echo "Installing imv"
sudo pacman -S --noconfirm imv

# --------------------------------------------------------------------------
# Docs
# --------------------------------------------------------------------------

# For pdf
# LibreOffice is potentially unsafe

echo "Installing LibreOffice"
sudo pacman -S --noconfirm libreoffice-still-ru

# Office productivity suite
# ONLYOFFICE Desktop Editors is potentially unsafe

echo "Installing ONLYOFFICE"
sudo flatpak install -y flathub org.onlyoffice.desktopeditors

# for other docs (.txt, .py ...)

echo "Installing cudatext-qt5-bin"
yay -S --noconfirm cudatext-qt5-bin

mkdir -p ~/.config/cudatext/settings
mkdir -p ~/.config/cudatext/settings_default
cp cudatext/settings/user.json ~/.config/cudatext/settings/user.json
cp cudatext/settings_default/default.json ~/.config/cudatext/settings_default/default.json

# --------------------------------------------------------------------------
# Developer Tools
# --------------------------------------------------------------------------

# Platform for building and using APIs
# Postman is potentially unsafe

echo "Installing Postman"
sudo flatpak install -y flathub com.getpostman.Postman

# DB Browser for SQLite is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite.
# DB Browser for SQLite is potentially unsafe

echo "Installing DB Browser for SQLite"
sudo pacman -S --noconfirm sqlitebrowser

# The most intelligent Python IDE
# PyCharm-Professional is potentially unsafe

echo "Installing PyCharm-Professional"
sudo flatpak install -y flathub com.jetbrains.PyCharm-Professional

# GoLand is a cross-platform IDE built specially for Go developers
# GoLand is potentially unsafe

echo "Installing GoLand"
sudo flatpak install -y flathub com.jetbrains.GoLand

# A cross-platform IDE for C and C++
# CLion is potentially unsafe

echo "Installing CLion"
sudo flatpak install -y flathub com.jetbrains.CLion

# Figma

echo "Installing figma-linux"
yay -S --noconfirm figma-linux

## Easily create 2D and 3D games
## Godot Engine is potentially unsafe
#
# echo "Installing Godot Engine"
# sudo flatpak install -y flathub org.godotengine.Godot

## Godot (C#/.NET) is potentially unsafe
#
# echo "Installing Godot (C#/.NET)"
# sudo flatpak install -y flathub org.godotengine.GodotSharp

## Godots is the ultimate hub for managing your Godot versions and projects.
## Godots is potentially unsafe
#
#echo "Installing Godots"
#sudo flatpak install -y flathub io.github.MakovWait.Godots

## Qt Designer lets you created and edit .ui files for your Qt Widgets Application
#
# echo "Installing Qt Designer"
# sudo flatpak install -y flathub io.qt.Designer

## Open-source electronics prototyping platform
## Arduino IDE v2 is potentially unsafe
#
# echo "Installing Arduino IDE v2"
# sudo flatpak install -y flathub cc.arduino.IDE2

# --------------------------------------------------------------------------
# Networking
# --------------------------------------------------------------------------

# Telegram

echo "Installing telegram-desktop"
sudo pacman -S --noconfirm telegram-desktop

# The web browser from Yandex
# Yandex Browser is potentially unsafe

echo "Installing Yandex Browser"
sudo flatpak install -y flathub ru.yandex.Browser

# Thunderbird is a free and open source email, newsfeed, chat, and calendaring client
# Thunderbird is potentially unsafe

echo "Installing Thunderbird"
sudo flatpak install -y flathub org.mozilla.Thunderbird

# --------------------------------------------------------------------------
# Utilities
# --------------------------------------------------------------------------

# Markdown-based knowledge base
# Obsidian is potentially unsafe

echo "Installing Obsidian"
sudo flatpak install -y flathub md.obsidian.Obsidian

# Read e-books

echo "Installing evince"
sudo pacman -S --noconfirm evince

# Fast and reliable FTP client
# FileZilla is potentially unsafe

echo "Installing FileZilla"
sudo flatpak install -y flathub org.filezillaproject.Filezilla

# Ark is a graphical file compression/decompression utility with 
# support for multiple formats, including tar, gzip, bzip2, rar and zip
# Ark is potentially unsafe

echo "Installing Ark"
sudo flatpak install -y flathub org.kde.ark

# --------------------------------------------------------------------------
# Entertainments 
# --------------------------------------------------------------------------

## A cross-platform downloader for manga and anime from various websites
## HakuNeko is potentially unsafe
#
# echo "Installing HakuNeko"
# sudo flatpak install -y flathub io.github.hakuneko.HakuNeko

# --------------------------------------------------------------------------
# Science
# --------------------------------------------------------------------------

## Molecular visualization and raytracing
## Python Molecular Graphics is potentially unsafe
#
# echo "Installing Python Molecular Graphics"
# sudo flatpak install -y flathub org.pymol.PyMOL

## A Realtime Satellite Orbit Visualizer
## OrbVis is probably safe
#
# echo "Installing OrbVis"
# sudo flatpak install -y flathub io.github.wojciech_graj.OrbVis

# --------------------------------------------------------------------------
# Install other gui app's 
# --------------------------------------------------------------------------

echo "Installing gnome-clocks"
sudo pacman -S --noconfirm gnome-clocks
