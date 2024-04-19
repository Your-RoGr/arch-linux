#!/bin/bash

sudo pacman -Sy tensorflow-cuda
sudo pacman -Sy --noconfirm python-pipx

python -m venv ~/jupyterlab
source ~/jupyterlab/bin/activate.fish
pip install jupyterlab
deactivate

#pipx install jupyterlab

#sudo mkdir /app
#sudo chmod -R 777 /app
#cp ~/.local/share/pipx/venvs/jupyterlab/bin/jupyter-lab /app/jupyter-lab

mkdir -p ~/.local/share/applications/
cp applications/jupyter-lab.desktop ~/.local/share/applications/jupyter-lab.desktop
cp applications/Jupyter_logo.png ~/.local/share/applications/Jupyter_logo.png

pipx install pgadmin4
cp applications/pgadmin4.desktop ~/.local/share/applications/pgadmin4.desktop
cp ~/.local/share/pipx/venvs/pgadmin4/bin/pgadmin4 /app/pgadmin4
cp applications/Postgresql_elephant.png ~/.local/share/applications/Postgresql_elephant.png

pipx ensurepath

