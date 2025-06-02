#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || { echo "${ERROR} Failed to change directory to $PARENT_DIR"; exit 1; }

if ! source "$(dirname "$(readlink -f "$0")")/../utils/functions.sh"; then
  echo "Failed to source functions.sh"
  exit 1
fi

LOG="Install-Logs/install-$(date +%d-%H%M%S)_github-cli.log"

install_package_pacman github-cli "$LOG"
