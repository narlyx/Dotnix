{
    # Imports
    imports = [
        ./hardware-configuration.nix
        ../shared
    ]

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

    # Docker
    virtualisation.oci-containers = {
        backend = "docker";
        containers = {
        
            # Minecraft
            minecraft = {
                image = "itzg/minecraft-server";
                ports = [
                    "25565:25565/tcp"
                    "19132:19132/udp"
                ];
                volumes = [
                    "/mnt/data/appdata/minecraft:/data"
                ];
                environment = {
                    # Configuration
                    EULA = "true";
                    TYPE = "fabric";
                    MODRINTH_LOADER = "fabric";
                    MODRINTH_ALLOWED_VERSION_TYPE = "beta";
                    VERSION_FROM_MODRINTH_PROJECTS = "true";
                    MODRINTH_PROJECTS = "fabric-api, geyser, floodgate";
                    # Properties
                    ENFORCE_SECURE_PROFILE = "false";
                    MOTD = "The freak zone :tongue:";
                    ICON = "/mnt/appdata/minecraft/server-icon.png";
                    MODE = "survival";
                    DIFFICULTY = "normal";
                    OPS = "B_unno";
                    ENFORCE_WHITELIST = "true";
                    WHITELIST = "B_unno, 00000000-0000-0000-0009-01ffddc2c1b5, 00000000-0000-0000-0009-01fe2c5384da, 00000000-0000-0000-0009-01f896c95dcd";
				};
            };

        };
    };

    # Hostname
    networking.hostName = "astrylx";
}
