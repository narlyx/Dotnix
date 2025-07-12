{
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
    touchpad = {
      tapping = true;
      tappingButtonMap = "lrm";
      tappingDragLock = false;
      clickMethod = "clickfinger";
      scrollMethod = "twofinger";
      horizontalScrolling = true;
      naturalScrolling = true;
      disableWhileTyping = true;
      accelProfile = "adaptive";
    };
  };
}
