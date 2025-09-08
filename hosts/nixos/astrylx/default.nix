{inputs, pkgs, lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/tailscale.nix
    ../common/users/techmin.nix
    ../common/users/www-data.nix

    inputs.copyparty.nixosModules.default
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  environment.systemPackages = with pkgs; [
  ];

  services = {
    copyparty = {
      enable = true;
      user = "www-data";
      group = "www-data";
      settings = {
        i = "0.0.0.0";
        p = [ 3210 ];
      };
      volumes = {
        "/" = {
          path = "/files";
          access = {
            rwdm = "*";
          };
        };
      };
    };

    syncthing = {
      enable = true;
      user = "www-data";
      group = "www-data";
      guiAddress = "0.0.0.0:8384";
      openDefaultPorts = true;
    };

    minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers = {
        death = {
          enable = true;
          autoStart = true;

          package = pkgs.vanillaServers.vanilla-1_21_8;
          jvmOpts =  "-Xms2G -Xmx4G";

          serverProperties = {
            motd = "Brunko's server of sadness and despair";
            online-mode = true;
            difficulty = 3;
            gamemode = 0;
            max-players = 12;
            server-port = 25565;
          };
        };

        paper = {
          enable = false;
          autoStart = true;

          package = pkgs.paperServers.paper-1_21_8;
          jvmOpts = "-Xms2G -Xmx4G";

          serverProperties = {
	    motd = "Brunko's server of sadness and despair";
            online-mode = true;
            difficulty = 3;
            gamemode = 0;
            max-players = 12;
            server-port = 25565;
            enforce-secure-profile = false;
          }; 

          symlinks = {
            "plugins/Geyser-Spigot.jar" = pkgs.fetchurl {
              url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
              sha512 = "sha512-M0bYF1e7dFkTFMhCf/H8oMiOmom35u3nuQjxxMk+2jW8/NMEZO3OMobIQBpoL6iCBgNkS7u2C12kqZiD2tHRRA==";
            };
            "plugins/floodgate-spigot.jar" = pkgs.fetchurl {
              url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
              sha512 = "sha512-T1aklDJIPUXg4FsD4OotVp4zxTMtqE9ewP6IJjy6dnLaG2nta/BEG8BtojDHX4Fxf/RXqiCk0MzInMdK7NL0sA==";
            };
          };
        };
      };
    };
  };

  networking.hostName = "astrylx";
}
