{
    boot.kernelParams = [
        "quiet"
    ];
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
    boot.plymouth = {
        enable = true;
        theme = "bgrt";
    };
}
