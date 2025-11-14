#! /usr/bin/env zsh

# Cache
FLAKE_DIR="$(cd "$(dirname "$0")"/../ && pwd)" # scriptPath/../

# Check if nix is installed
if command -v nix; then
  echo "Nix is installed, proceeding..."
else
  echo "Nix is missing, installing now..."
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
  echo "The shell is being reloaded, please rerun the script"
  exec zsh
fi

# Nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild --extra-experimental-features "nix-command flakes" -- switch --flake $FLAKE_DIR
