{ pkgs, ... }: {
    # Modules
    imports = [
        ./hardware-configuration.nix
        ../shared
    ];

    # Raid array
    boot.initrd.systemd.enable = true;
    boot.swraid = {
        enable = true;
        mdadmConf = ''
            MAILADDR root
            ARRAY /dev/md0 level=raid1 num-devices=2 metadata=1.2 UUID=d3d7e5f2:6d76c572:5c7f029a:10e14f43 devices=/dev/sda1,/dev/sdb1
        '';
    };
    fileSystems = {
        "/data" = {
            device = "/dev/md0";
            fsType = "ext4";
        };
    };

    # NAS
    services.nfs.server = {
        enable = true;
        exports = ''
            /data 192.168.0.0/24(rw,no_root_squash,no_subtree_check)
            # TODO: restrict IP address range
        '';
    };

    # Firewall
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [
            2049 # nfs
        ];
        allowedUDPPorts = [
        ];
    };

    # Hostname
    networking.hostName = "hisoka";
}
