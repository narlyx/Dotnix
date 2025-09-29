{inputs, pkgs, lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/tailscale.nix
    ../common/users/www-data.nix
  ];

  services.samba = {
    enable = true;
    securityType = "user";

    shares."files" = {
      path = "/mnt/share";
      browsable = true;
      writable = true;
      "valid users" = "www-data";
      "guest ok" = false;
      "create mask" = "0644";
      "directory mask" = "0755";
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 139 445 ];
    allowedUDPPorts = [ 137 138 ];
  };

  networking.hostName = "sylvester";
}
