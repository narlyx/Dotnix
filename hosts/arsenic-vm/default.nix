{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =[
    ./hardware-configuration.nix
    ../common/nixos
    ../common/nixos/grub.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "arsenic-vm";
  networking.networkmanager.enable = true;

  system.stateVersion = "24.11";
}

