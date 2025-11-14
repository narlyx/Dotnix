{ pkgs, ... }: {
  # Modules
  imports = [
    ./hardware-configuration.nix

    ../common/nixos/base
    ../common/nixos/system/grub-uefi.nix
    ../common/nixos/services/ssh.nix
    ../common/nixos/services/tailscale.nix
    ../common/nixos/users/www-data.nix
    ../common/shared/packages.nix
  ];

  # Hostname
  networking.hostName = "krylith";
}
