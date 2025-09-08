{inputs, pkgs, lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/tailscale.nix
    ../common/users/techmin.nix
    ../common/users/www-data.nix
  ];

  networking.hostName = "astrylx";
}
