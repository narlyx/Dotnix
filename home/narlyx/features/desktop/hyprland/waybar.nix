{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];

  home.file.".config/waybar" = {
    source = ../../../dotfiles/waybar;
    recursive = true;
  };
}
