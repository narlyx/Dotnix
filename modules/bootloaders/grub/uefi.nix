{
    boot.loader = {
        efi = {
            canTouchEfiVariables = false;
            efiSysMountPoint = "/boot";
        };
        grub = {
            efiSupport = true;
            efiInstallAsRemovable = true;
            device = "nodev";
        };
    };
}
