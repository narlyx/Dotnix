{ pkgs, ... }: {
    # Modules
    imports = [
        ./hardware-configuration.nix
        ../shared
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

    # Services
		services = {

		# Dashboard
		glance = {
			enable = true;
			settings.server = {
			host = "0.0.0.0";
			port = 8080;
			};
			settings.pages = [
				{
					name = "The Narlyx Network";
					width = "slim";
					hide-desktop-navigation = true;
					center-vertically = true;
					columns = [
						{
							size = "full";
							widgets = [
								{
									type = "search";
									autofocus = true;
								}
								{
									type = "monitor";
									cache = "1m";
									title = "Services";
									sites = [
										{
											title = "Homepage";
											url = "https://narlyx.net";
											icon = "sh:glance";
										}
										{
											title = "Nextcloud";
											url = "https://nextcloud.narlyx.net";
											icon = "sh:nextcloud";
										}
										{
											title = "Vaultwarden";
											url = "https://vault.narlyx.net";
											icon = "sh:bitwarden";
										}
										{
											title = "N8N";
											url = "https://n8n.narlyx.net";
											icon = "sh:n8n";
										}
										{
											title = "Proxmox";
											url = "https://proxmox.narlyx.net";
											icon = "sh:proxmox";
										}
									];
								}
							];
						}
					];
				}
			];
		};

		# Files
		nextcloud = {
			enable = true;
			hostName = "0.0.0.0";
			package = pkgs.nextcloud32;
			https = true;
			extraAppsEnable = true;
			extraApps = {
				inherit (pkgs.nextcloud32Packages.apps) cookbook onlyoffice contacts mail;
			};
			home = "/mnt/data/nextcloud";
			configureRedis = true;
			config = {
				dbtype = "sqlite";
				adminuser = "admin";
				adminpassFile = "/mnt/data/secrets/nextcloud-admin-pass";
			};
			settings = {
				trusted_domains = [ "100.64.0.12" "krylith" "krylith.narlyx.tailnet" "nextcloud.narlyx.net" ];
			};
		};

		# Document server
		#onlyoffice = {
		#  enable = true;
		#  hostname = "localhost";
		#  port = 8000;
		#};

		# Password manager
		vaultwarden = {
			enable = true;
			environmentFile = "/mnt/data/secrets/vaultwarden-environment";
			backupDir = "/mnt/data/appdata/vaultwarden";
			config = {
				DOMAIN = "https://vault.narlyx.net";
				SIGNUPS_ALLOWED = false;
				ROCKET_ADDRESS = "0.0.0.0";
				ROCKET_PORT = 8222;
				ROCKET_LOG = "critical";
			};
		};

		# Automation
		n8n = {
			enable = true;
			environment = {
				N8N_PORT = 5678;
				#N8N_USER_FOLDER = "/mnt/data/appdata/n8n"; read-only value?!
				N8N_SECURE_COOKIE = "false";
				N8N_EDITOR_BASE_URL = "https://n8n.narlyx.net";
			};
		};

    };

    # Containers
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
    networking.hostName = "krylith";
}
