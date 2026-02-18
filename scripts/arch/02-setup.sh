#!/bin/bash

# Setup PATH
#export PATH=~/scripts/bin/:$PATH
# need to be inside fish config

# Install conda
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh

# Install necessary conda packages
conda create -n ai python=3.10
conda activate ai
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
pip install jupyterlab transformers datasets matplotlib
pip install optuna
pip install hyperbox-brain
