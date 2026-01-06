#! /usr/bin/env zsh
FLAKE_DIR="$(cd "$(dirname "$0")"/../ && pwd)"
nix run home-manager -- switch --flake $FLAKE_DIR -b bak
