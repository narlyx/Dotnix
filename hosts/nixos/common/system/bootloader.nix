{...}: {
  boot.loader = {
    timeout = 5;
    efi = {
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      devices = ["nodev"];
      useOSProber = true;
    };
  };
}
