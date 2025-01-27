{ config, pkgs, ... }:

{
  # Other modules
  imports = [
    ../../modules/shared/tailscale.nix
  ];

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
      trackpad = {
        Clicking = false;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 2;
        TrackpadThreeFingerDrag = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        magnification = true;
        largesize = 64;
        tilesize = 48;
      };
      screencapture.target = "clipboard";
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
}
