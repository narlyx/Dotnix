{
  inputs,
  lib,
  ...
}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/environments/hyprland.nix
    ../common/features/virtualisation.nix
    ../common/features/tailscale.nix
  ];

  # Hostname
  networking.hostName = "nexora";

  # System version
  system.stateVersion = "24.11";
}
