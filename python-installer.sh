#!/bin/bash

sudo pacman -Sy --noconfirm tensorflow-cuda

python -m venv ~/jupyterlab
source ~/jupyterlab/bin/activate
pip install jupyterlab
deactivate
