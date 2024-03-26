#!/bin/bash

# flatpak gui app's 

# install flatpak 
echo "Installing flatpak"
sudo pacman -S --noconfirm flatpak


# Audio & Video

# VLC media player, the open-source multimedia player
# VLC is potentially unsafe

echo "Installing VLC"
flatpak install -y flathub org.videolan.VLC

# Live stream and record videos
# OBS Studio is potentially unsafe

echo "Installing OBS Studio"
flatpak install -y flathub com.obsproject.Studio

# Vector Graphics Editor
# Inkscape is potentially unsafe

echo "Installing Inkscape"
flatpak install -y flathub org.inkscape.Inkscape

# Free and open source 3D creation suite
# Blender is potentially unsafe

echo "Installing Blender"
flatpak install -y flathub org.blender.Blender

# Digital Painting, Creative Freedom
# Krita is potentially unsafe

echo "Installing Krita"
flatpak install -y flathub org.kde.krita

# Developer Tools

# Platform for building and using APIs
# Postman is potentially unsafe

echo "Installing Postman"
flatpak install -y flathub com.getpostman.Postman


# DB Browser for SQLite is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite.
# DB Browser for SQLite is potentially unsafe

echo "Installing DB Browser for SQLite"
flatpak install -y flathub org.sqlitebrowser.sqlitebrowser


# The most intelligent Python IDE
# PyCharm-Professional is potentially unsafe

echo "Installing PyCharm-Professional"
flatpak install -y flathub com.jetbrains.PyCharm-Professional


# GoLand is a cross-platform IDE built specially for Go developers
# GoLand is potentially unsafe

echo "Installing GoLand"
flatpak install -y flathub com.jetbrains.GoLand


# A cross-platform IDE for C and C++
# CLion is potentially unsafe

echo "Installing CLion"
flatpak install -y flathub com.jetbrains.CLion


# Easily create 2D and 3D games
# Godot Engine is potentially unsafe

# echo "Installing Godot Engine"
# flatpak install -y flathub org.godotengine.Godot


# Godots is the ultimate hub for managing your Godot versions and projects.
# Godots is potentially unsafe

echo "Installing Godots"
flatpak install -y flathub io.github.MakovWait.Godots


# Godot (C#/.NET) is potentially unsafe

# echo "Installing Godot (C#/.NET)"
# flatpak install -y flathub org.godotengine.GodotSharp


# Qt Designer lets you created and edit .ui files for your Qt Widgets Application

# echo "Installing Qt Designer"
# flatpak install -y flathub io.qt.Designer


# Open-source electronics prototyping platform
# Arduino IDE v2 is potentially unsafe

# echo "Installing Arduino IDE v2"
# flatpak install -y flathub cc.arduino.IDE2


# Networking

# Fast. Secure. Powerful.
# Telegram Desktop is potentially unsafe

echo "Installing Telegram Desktop"
flatpak install -y flathub org.telegram.desktop


# The web browser from Yandex
# Yandex Browser is potentially unsafe

echo "Installing Yandex Browser"
flatpak install -y flathub ru.yandex.Browser


# Messaging, voice and video client
# Discord is potentially unsafe

echo "Installing Discord"
flatpak install -y flathub com.discordapp.Discord


# Thunderbird is a free and open source email, newsfeed, chat, and calendaring client
# Thunderbird is potentially unsafe

echo "Installing Thunderbird"
flatpak install -y flathub org.mozilla.Thunderbird


# Utilities

# Obsidian is potentially unsafe
# Obsidian is potentially unsafe

echo "Installing Obsidian"
flatpak install -y flathub md.obsidian.Obsidian

# Read e-books in style
# Foliate is potentially unsafe

echo "Installing Foliate"
flatpak install -y flathub com.github.johnfactotum.Foliate

# Powerful and simple to use screenshot software
# Flameshot is potentially unsafe

echo "Installing Flameshot"
flatpak install -y flathub org.flameshot.Flameshot

# Fast and reliable FTP client
# FileZilla is potentially unsafe

echo "Installing FileZilla"
flatpak install -y flathub org.filezillaproject.Filezilla

# Ark is a graphical file compression/decompression utility with 
# support for multiple formats, including tar, gzip, bzip2, rar and zip
# Ark is potentially unsafe

echo "Installing Ark"
flatpak install -y flathub org.kde.ark

# Pick any color from your screen and view it in different formats

echo "Installing Eyedropper"
flatpak install -y flathub com.github.finefindus.eyedropper

# A simple and elegant clock application. It includes world clocks, alarms, a stopwatch, and timers.
# Clocks is probably safe

echo "Installing Clocks"
flatpak install -y flathub org.gnome.clocks

# Bottles lets you run Windows software on Linux, such as applications and games.
# Bottles is potentially unsafe

echo "Installing Bottles"
flatpak install -y flathub com.usebottles.bottles


# Entertainments 

# A cross-platform downloader for manga and anime from various websites
# HakuNeko is potentially unsafe

# echo "Installing HakuNeko"
# flatpak install -y flathub io.github.hakuneko.HakuNeko


# Games

# Launcher for the Steam software distribution service
# Steam is potentially unsafe

echo "Installing Steam"
flatpak install -y flathub com.valvesoftware.Steam


# x86/DOS emulator with sound and graphics
# DOSBox is potentially unsafe

# echo "Installing DOSBox"
# flatpak install -y flathub com.dosbox.DOSBox


# Science

# Powerful and easy to use calculator
# Qalculate! (Qt UI) is probably safe

echo "Installing Qalculate"
flatpak install -y flathub io.github.Qalculate.qalculate-qt


# Molecular visualization and raytracing
# Python Molecular Graphics is potentially unsafe

# echo "Installing Python Molecular Graphics"
# flatpak install -y flathub org.pymol.PyMOL


# A Realtime Satellite Orbit Visualizer
# OrbVis is probably safe

# echo "Installing OrbVis"
# flatpak install -y flathub io.github.wojciech_graj.OrbVis


# Install other gui app's 


$SHELL
