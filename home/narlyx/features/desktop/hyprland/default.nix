{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    walker
  ];

  home.file.".config/hypr" = {
    source = ../../../dotfiles/hyprland;
    recursive = true;
  };

}
