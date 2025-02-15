{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Imports section
  imports = [
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
  ];

  # Hostname
  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };
}
