{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/ssh.nix
    ../common/features/tailscale.nix
    ../common/users/techmin.nix

    inputs.copyparty.nixosModules.default
  ];

  services = {
    copyparty = {
      enable = true;
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
  };

  networking.hostName = "astrylx";
}
