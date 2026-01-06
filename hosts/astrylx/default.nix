{
    # Imports
    imports = [
        ./hardware-configuration.nix
        ../shared
    ];

    # Nas
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
