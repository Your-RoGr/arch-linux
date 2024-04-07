#!/bin/bash

sudo pacman -Sy --noconfirm python-pipx
pipx install jupyterlab
pipx ensurepath
