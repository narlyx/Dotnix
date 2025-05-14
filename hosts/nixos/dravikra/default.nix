{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users/techmin.nix
    ../common/services/ssh.nix
    ../common/services/tailscale.nix
  ];

  # Mysql server
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  networking.hostName = "dravikra";
  system.stateVersion = "25.05";
}
