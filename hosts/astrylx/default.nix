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

  # Hostname
  networking.hostName = "astrylx";
}
