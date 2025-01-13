#! /bin/sh

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Nix installer
if ! command -v nix >/dev/null 2>&1; then
  echo "Nix is not installed. Installing..."
  curl -L https://nixos.org/nix/install | sh
fi

# Running nix-darwin
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake $SCRIPT_DIR
