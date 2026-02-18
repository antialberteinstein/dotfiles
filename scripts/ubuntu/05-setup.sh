#!/bin/bash

# TPM Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# omh Oh My Fish - Fish Plugin Manager
# Ensure fish is installed first (done in 01)
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf install agnoster
