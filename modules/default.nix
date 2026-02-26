{ inputs, pkgs, ... }: {

    # Imports
    imports = [

        # Add home-manager
        inputs.home-manager.nixosModules.home-manager

        # Root user
        ./users/root

        # Vim
        ./apps/vim

        # SSH
        ./services/ssh

    ];

    # Networking
    networking.networkmanager.enable = true;

    # Localization
    time.timeZone = "America/Boise";
    i18n.defaultLocale = "en_US.UTF-8";

    # QOL system packages
    environment.systemPackages = with pkgs; [
        git
        tree
        zip
        p7zip
        unzip
    ];

    # Services
    services.tailscale.enable = true;

    # Experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Unfree packages
    nixpkgs.config.allowUnfree = true;

    # System version 
    system.stateVersion = "25.11";

}
