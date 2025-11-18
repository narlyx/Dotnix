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

  # NAS
  fileSystems."/mnt/data" = {
    device = "192.168.0.159:/data";
    fsType = "nfs";
    neededForBoot = false;
    options = [
      "rw"
      "nfsvers=4"
      "_netdev"
      "nofail"
    ];
  };

  # Services
  services = {

    # Nextcloud
    nextcloud = {
      enable = true;
      hostName = "0.0.0.0";
      package = pkgs.nextcloud32;
      https = true;
      extraAppsEnable = true;
      extraApps = {
        inherit (pkgs.nextcloud32Packages.apps) cookbook onlyoffice;
      };
      home = "/mnt/data/nextcloud";
      configureRedis = true;
      config = {
        dbtype = "sqlite";
        adminuser = "admin";
        adminpassFile = "/mnt/data/nextcloud/passphrase";
      };
      settings = {
        trusted_domains = [ "100.64.0.12" "krylith" "krylith.narlyx.tailnet" "nextcloud.narlyx.net" ];
      };
    };

    # Document server
    onlyoffice = {
      enable = true;
      hostname = "localhost";
      port = 8000;
    };

  };

  # Containers
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
    };
  };

  # Hostname
  networking.hostName = "krylith";
}
