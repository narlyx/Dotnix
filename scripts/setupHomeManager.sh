#! /usr/bin/env zsh

FLAKE_DIR="$(cd "$(dirname "$0")"/../ && pwd)" # scriptPath/../

nix run home-manager -- switch --flake $FLAKE_DIR
