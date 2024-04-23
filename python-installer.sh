#!/bin/bash

echo "Install CUDA? (press enter for install or write "skip"):"
read cuda_install
cuda_install=$(echo $cuda_install | tr -cd '[:alnum:]_-')
cuda_install=${cuda_install:-1}
echo "You entered: $cuda_install"

if [[ "${cuda_install:0:4}" == "skip" ]]; then
    echo "CUDA installing skipped"
else
    sudo pacman -Sy --noconfirm tensorflow-cuda
fi

sudo mkdir /app
sudo chmod -R 777 /app

python -m venv ~/jupyterlab
source ~/jupyterlab/bin/activate
pip install -r requirements.txt
deactivate
