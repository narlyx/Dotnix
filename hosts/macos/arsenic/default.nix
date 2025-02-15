{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Locale
  time.timeZone = "America/Boise";

  # Hostname
  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  # Packages
  environment.systemPackages = with pkgs; [
    wget
    git
    vim
    curl
  ];

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Services
  services = {
    tailscale.enable = true;
  };

  # Settings
  security.pam.enableSudoTouchIdAuth = true;
  
  # System settings
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
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };

    # System vesion
    stateVersion = 5;
  };
}
