{ inputs, pkgs, ... }: {
  # Modules
  imports = [
    inputs.mac-app-util.darwinModules.default
    ../common/shared/packages.nix
    ../common/shared/fonts.nix
    ../common/shared/settings.nix
  ];

  # Services
  services.tailscale.enable = true;

  # Setting up user narlyx
  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };

  # Default shell for narlyx
  programs.zsh.enable = true;
  system.activationScripts.postActivation.text = ''
    sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx
  '';

  # Primary user
  system.primaryUser = "narlyx";

  # Locale
  time.timeZone = "America/Boise";

  # Networking
  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  # MacOS configuration
  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    trackpad = {
      Clicking = false;
      Dragging = false;
      FirstClickThreshold = 0;
      SecondClickThreshold = 0;
      TrackpadThreeFingerDrag = true;
    };
    dock = {
      autohide = true;
      show-recents = true;
      magnification = true;
      largesize = 64;
      tilesize = 48;
      mru-spaces = false;
    };
    screencapture = {
      include-date = true;
      target = "file";
      location = "~/Pictures/Screenshots";
      type = "jpg";
    };
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      AppleInterfaceStyle = "Dark";
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
  };

  # Version
  system.stateVersion = 6;
}
