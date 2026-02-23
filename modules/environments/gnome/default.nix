{ pkgs, ... }: {

    # Imports
    imports = [
        ../../services/distrobox
    ];

    # Setup Gnome
    services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        gnome = {
            core-developer-tools.enable = false;
            games.enable = false;
        };
    };
    environment.gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
        # daobab
        # decibels
        cheese
        # eog
        epiphany
        gedit
        # simple-scan
        # totem
        yelp
        evince
        geary
        seahorse
        papers
        snapshot
        gnome-calculator
        gnome-clocks
        gnome-calendar
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-photos
        gnome-weather
        gnome-terminal
        gnome-text-editor
        # gnome-disk-utility
        gnome-connections
    ];

    # Audio services
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    # Printing services
    services = {
        printing = {
            enable = true;
            drivers = [ pkgs.hplip ];
        };
        avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };


    # System packages
    environment.systemPackages = with pkgs; [
        gnomeExtensions.blur-my-shell
        gnomeExtensions.appindicator
        gnomeExtensions.caffeine
        gnomeExtensions.mpris-label
    ];


    # Narlyx configuration
    home-manager.users.narlyx = {
        imports = [
            ../../users/narlyx/apps/librewolf
            ../../users/narlyx/apps/ghostty
        ];
        home.packages = with pkgs; [
            spotify
            discord
            onlyoffice-desktopeditors
            thunderbird
            nextcloud-client
            gradia
            bitwarden-desktop
        ];
        dconf = {
            enable = true;
            settings = {
                "org/gnome/shell" = {
                    enabled-extensions = with pkgs.gnomeExtensions; [
                        blur-my-shell.extensionUuid
                        appindicator.extensionUuid
                        panel-corners.extensionUuid
                        caffeine.extensionUuid
                        mpris-label.extensionUuid
                    ];
                };
                "org/gnome/desktop/interface" = {
                    color-scheme = "prefer-dark";
                    accent-color = "blue";
                };
            };
        };
    };
}
