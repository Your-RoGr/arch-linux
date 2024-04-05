#!/bin/bash

sudo pacman -S --noconfirm python-pipx
pipx install jupyterlab
pipx ensurepath
