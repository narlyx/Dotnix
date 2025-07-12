{pkgs, ...}: {
  # Dependancies
  programs.dconf.enable = true;
  # Greeter
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time";
        user = "greeter";
      };
    };
  };
  # Desktop
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      startx.enable = true;
    };
    windowManager.i3 = {
      enable = true;
    };
  };
}
