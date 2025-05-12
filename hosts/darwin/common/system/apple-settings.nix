{
  # TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # MacOS
  system = {
    defaults = {
      # Trackpad
      trackpad = {
        Clicking = false;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadThreeFingerDrag = true;
      };
      # Dock
      dock = {
        autohide = true;
        show-recents = true;
        magnification = true;
        largesize = 64;
        tilesize = 48;
        mru-spaces = false;
      };
      # Screenshots
      screencapture = {
        include-date = true;
        target = "clipboard";
        type = "jpg";
      };
      # Other
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleInterfaceStyle = "Dark";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };
}
