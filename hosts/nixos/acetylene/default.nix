{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/desktops/plasma.nix
    ../common/services/ssh.nix
    ../common/services/tailscale.nix
  ];

  services.flatpak.enable = true;

  networking.hostName = "acetylene";
  system.stateVersion = "25.05";
}
