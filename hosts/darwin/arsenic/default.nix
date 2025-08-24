{inputs, pkgs, ...}: {
  imports = [
    ../../nixos/common/base/extraPackages.nix
    inputs.mac-app-util.darwinModules.default
  ];

  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  system.activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx'';
  system.primaryUser = "narlyx";

  services.tailscale.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    defaults = {
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
        target = "clipboard";
        type = "jpg";
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleInterfaceStyle = "Dark";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Boise";

  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  system.stateVersion = 6;
}
