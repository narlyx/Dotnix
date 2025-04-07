{...}: {
  # Using touchId for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # MacOS settings
  system = {
    defaults = {
      # Trackpad
      trackpad = {
        Clicking = false;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 2;
        TrackpadThreeFingerDrag = true;
      };
      #Dock
      dock = {
        autohide = true;
        show-recents = false;
        magnification = true;
        largesize = 64;
        tilesize = 48;
        mru-spaces = false;
      };
      # Screenshots
      screencapture = {
        include-date = true;
        location = "/Users/narlyx/Pictures/Screenshots";
        target = "file";
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
