{ config, pkgs, ... }:

{
  # User
  users.users.narlyx.home = "/Users/narlyx";

  # System packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # Experimental features
  nix.settings.experimental-features = "nix-command flakes";

  # Macos settings
  security.pam.enableSudoTouchIdAuth = true;
  system = {
    defaults = {
      trackpad.TrackpadThreeFingerDrag = true;
      dock = {
        autohide = true;
        show-recents = false;
        magnification = true;
        largesize = 64;
        tilesize = 48;
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleInterfaceStyle = "Dark";
      };
    };

    # Version
    stateVersion = 5;
  };

  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Services
  services = {
    tailscale = {
      enable = true;
    };
  };
}
