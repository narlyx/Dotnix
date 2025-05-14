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
    configFile = pkgs.writeText "my.cnf" ''
      [mysqld]
      datadir = /var/lib/mysql
      bind-address = 0.0.0.0
      port = 3306
    '';
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3306 ];
    allowedUDPPorts = [ 3306 ];
  };

  networking.hostName = "dravikra";
  system.stateVersion = "25.05";
}
