{inputs, pkgs, lib, config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/tailscale.nix
    ../common/users/www-data.nix

    inputs.copyparty.nixosModules.default
  ];

  fileSystems."/mnt/share" = {
    device = "//192.168.0.159/files";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-system.mount-timeout=5s";
    in ["${automount_opts},credentials=${config.sops.templates."share_credentials".path},uid=33,gid=33"];
  };

  services.copyparty = {
    enable = true;
    user = "www-data";
    group = "www-data";
    settings = {
      i = "0.0.0.0";
      p = [ 3210 ];
    };
    accounts = {
      "narlyx".passwordFile = config.sops.secrets."narlyx_password".path;
    };
    volumes = {
      "/narlyx" = {
        path = "/mnt/share/users/narlyx";
        access = {
          rwdm = "narlyx";
        };
      };
    };
  };

  services.syncthing = {
    enable = true;
    user = "www-data";
    group = "www-data";
    guiAddress = "0.0.0.0:8384";
    #guiAddress = "127.0.0.1:8384";
    dataDir = "/mnt/share/appdata/syncthing";
    settings = {
      devices = {
        "dravikra".id = "NMZNJMA-Q3FZPXT-KRRUTUT-ZSMPSUF-KRLURCB-ZXQ7KR2-V4TQUUK-DSPEKAJ";
        "acetylene".id = "LB66WPF-7K7NI55-UEPJZZX-VTJBI7A-7LIVCH5-LW3CWHS-4YD7CXJ-6BKT4AZ";
        "iPhone".id = "FXBA4SU-KFFGF3I-ELI2XXO-6IAGYSH-ZQFVPE6-KPSVOXR-2WCMT4T-B6Q4KAP";
      };
      folders = {
        "Narlyx/Documents" = {
          path = "/mnt/share/users/narlyx/Documents";
          devices = [ "dravikra" "acetylene" ];
          versioning = {
            type = "trashcan";
            params.keep = "30";
          };
        };
        "Narlyx/Developer" = {
          path = "/mnt/share/users/narlyx/Developer";
          devices = [ "dravikra" "acetylene" ];
        };
        "Narlyx/Camera Roll" = {
          path = "/mnt/share/users/narlyx/Media/Camera Roll/2025";
          devices = [ "iPhone" ];
          versioning = {
            type = "trashcan";
            params.keep = "30";
          };
        };
        "Narlyx/Screen Captures" = {
          path = "/mnt/share/users/narlyx/Media/Screen Captures/2025 Captures";
          devices = [ "dravikra" "acetylene" ];
          versioning = {
            type = "trashcan";
            params.keep = "30";
          };
        };
        "Narlyx/Content" = {
          path = "/mnt/share/users/narlyx/Media/Content Creation";
          devices = [ "acetylene" ];
          versioning = {
            type = "trashcan";
            params.keep = "30";
          };
        };
        "Narlyx/Music Library" = {
          path = "/mnt/share/users/narlyx/Library/Music";
          devices = [ ];
        };
        "Narlyx/Book Library" = {
          path = "/mnt/share/users/narlyx/Library/Books";
          devices = [ ];
        };
        "Narlyx/Webfishing" = {
          path = "/mnt/share/users/narlyx/Misc/Appdata/Webfishing";
          devices = [ "acetylene" "dravikra" ];
        };
      };
    };
  };

  services.vaultwarden = {
    enable = true;
    environmentFile = "${config.sops.templates."vaultwarden_env".path}";
    config = {
      #DOMAIN = "https://vault.narlyx.net";
      SIGNUPS_ALLOWED = false;

      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3210 22000 8222 ];
    allowedUDPPorts = [ 22000 21027 ];
  };

  networking.hostName = "astrylx";
}
