#!/usr/bin/env bash

sudo pacman -S --noconfirm zsh starship
hash -r
sudo chsh -s $(which zsh)
