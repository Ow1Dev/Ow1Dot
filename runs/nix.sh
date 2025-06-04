#!/usr/bin/env bash

# Check if already installed
if command -v nix &>/dev/null; then
  echo " Nix is already installed." | tee -a "$LOG"
  exit 0
fi

# Install multi-user Nix
echo "⬇️  Installing Nix (multi-user mode with daemon)..." | tee -a "$LOG"
sh <(curl -L https://nixos.org/nix/install) --daemon 2>&1 | tee -a "$LOG"

# Enable and start the nix-daemon
echo "🔧 Enabling nix-daemon..." | tee -a "$LOG"
sudo systemctl enable --now nix-daemon.service nix-daemon.socket 2>&1 | tee -a "$LOG"

# Suggest shell config update
echo -e "\n Nix installed." | tee -a "$LOG"
