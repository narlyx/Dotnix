{ pkgs, ... }:

{
  imports = [ ./pipewire.nix ];
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
      startx.enable = true;
    };
    windowManager.i3 = {
      enable = true;
    };
  };
}
