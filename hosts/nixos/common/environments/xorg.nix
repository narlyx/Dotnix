{pkgs, ...}: {
  # Dependancies
  imports = [ ../features/pipewire.nix ];
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
  # Applications
  environment.systemPackages = with pkgs; [
    pavucontrol
    helvum
  ];
}
