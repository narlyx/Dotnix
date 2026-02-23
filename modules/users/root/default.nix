{
    # Create user
    users.users.root = {
        # SSH login key
        openssh.authorizedKeys.keys = [ ''ssh-ed25519 aaaac3nzac1lzdi1nte5aaaaimxdo/fjlr/4xeozytzbdsolkp3loevu/gsrmnrjg9wd'' ];
    };

    # Setup home-manager
    home-manager.users.root = { pkgs, ... }: {
        home = {
            username = "root";
            homeDirectory = "/root";
            stateVersion = "25.11";
        };
    };
}

