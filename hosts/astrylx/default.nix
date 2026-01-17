{ config, ... }: {
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

	# WireGuard
	networking.wireguard.enable = true;
	networking.wireguard.interfaces = {
		wg0 = {
			ips = [ "10.74.7.41/32" "fc00:bbbb:bbbb:bb01::b:728/128" ];
			listenPort = 51820;
			privateKeyFile = "/mnt/data/secrets/mullvad-wg.key";
			peers = [
				{
					publicKey = "SE7HGeByhTo8Ak7FGsjvrYOUJTydQ2L8fWjo17IvhSw=";
					allowedIPs = [ "0.0.0.0/0" "::/0" ];
					endpoint = "69.4.234.10:51820";
					persistentKeepalive = 25;
				}
			];
		};
	};
	networking.interfaces.enp1s0.ipv4.routes = [
		{
			address = "69.4.234.10";
			prefixLength = 32;
			via = "192.168.0.1";
		}
	];

	# Firewall
	networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 22 ];
		allowedUDPPorts = [ 
			config.networking.wireguard.interfaces.wg0.listenPort
		];
	};

    # Hostname
    networking.hostName = "astrylx";
}
