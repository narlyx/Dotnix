{ inputs, outputs, lib, config, pkgs, ... }:

{
  # Imports
  imports = [
    # outputs.darwinModules.example
  ];

  # User
  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };

  # Timezone
  time.timeZone = "America/Boise";

  # Networking
  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  # Environment settings
  environment = {
    # Packages
    systemPackages = with pkgs; [
      # System tools
      wget
      git
      vim
      neovim
      zsh
    ];
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Services
  services = {
    tailscale.enable = true;
  };

  # Security settings
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

    # Declaring defualt shell for narlyx
    activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx'';

    # Version
    stateVersion = 5;
  };
}
