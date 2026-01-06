#! /usr/bin/env bash
FLAKE_DIR="$(cd "$(dirname "$0")"/../ && pwd)"
sudo nixos-rebuild switch --flake $FLAKE_DIR
