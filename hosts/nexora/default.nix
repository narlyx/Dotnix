{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/nixos
    ../common/nixos/grub.nix
    ../common/features/hyprland.nix
    ../common/features/virtualisation.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };

  networking.hostName = "nexora";
  networking.networkmanager.enable = true;
  
  system.stateVersion = "24.11";
}
