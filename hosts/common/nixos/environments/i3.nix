{ pkgs, ... }: {
  programs.dconf.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time";
        user = "greeter";
      };
    };
  };
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.startx.enable = true;
    windowManager.i3.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
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
  environment.systemPackages = with pkgs; [
    helvum
    pavucontrol
  ];
}
