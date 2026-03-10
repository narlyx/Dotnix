{

    # Shell
    imports = [ ./apps/zsh ];

    # Create user
    users.users.narlyx = {
        isNormalUser = true;
        initialPassword = "changeme";
        extraGroups = [
            "wheel"
            "audio"
            "video"
            "render"
            "input"
            "networkmanager"
            "libvirtd"
            "docker"
            "vboxusers"
        ];
        openssh.authorizedKeys.keys = [ ''ssh-ed25519 aaaac3nzac1lzdi1nte5aaaaimxdo/fjlr/4xeozytzbdsolkp3loevu/gsrmnrjg9wd'' ];
    };

    # Setup home-manager
    home-manager.users.narlyx = {
        imports = [
            ./apps/bash
            ./apps/starship
            ./apps/zoxide
            ./apps/git
            ./apps/tmux
            ./apps/emacs
        ];
        home = {
            username = "narlyx";
            homeDirectory = "/home/narlyx";
            stateVersion = "25.11";
        };
    };

}

