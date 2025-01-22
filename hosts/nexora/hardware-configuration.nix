{ inputs, outputs, config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader = {
    timeout = 5;
    efi = {
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable= true;
      devices = [ "nodev" ];
    };
  };

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/49224b79-8501-4172-b542-f301613a1dc3";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/49224b79-8501-4172-b542-f301613a1dc3";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/49224b79-8501-4172-b542-f301613a1dc3";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7C3C-4422";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
