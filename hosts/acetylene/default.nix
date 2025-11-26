{ pkgs, ... }: {
  # Modules
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix

    ../common/nixos/base
    ../common/shared/packages.nix
    ../common/shared/fonts.nix
    ../common/nixos/system/grub-uefi.nix
    ../common/nixos/system/bluetooth.nix
    ../common/nixos/services/gpg.nix
    ../common/nixos/services/ssh.nix
    ../common/nixos/services/tailscale.nix
    ../common/nixos/services/printing.nix
    ../common/nixos/services/flatpak.nix
    ../common/nixos/users/narlyx.nix
    ../common/nixos/apps/virtualisation.nix
    ../common/nixos/environments/i3.nix
  ];

  # Specialty
  programs.steam.enable = true;

  # Hostname
  networking.hostName = "acetylene";
}
