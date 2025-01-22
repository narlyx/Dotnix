{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
  ];
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };
  home.file.".config/i3" = {
    source = ../../../dotfiles/i3;
    recursive = true;
  };
}
