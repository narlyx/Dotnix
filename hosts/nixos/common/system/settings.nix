{
  nixpkgs.config.allowunfree = true;
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
