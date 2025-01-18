{ config, lib, pkgs, ... }:

{
  # Dependancies
  home.packages = with pkgs; [
    rofi
  ];

  # Configuring i3
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };

  # Linking configuration
  home.file.".config/i3" = {
    source = ../../dotfiles/i3;
    recursive = true;
  };
}
