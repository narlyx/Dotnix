{ pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    walker
  ];

  home.file.".config/hypr" = {
    source = ../../../dotfiles/hyprland;
    recursive = true;
  };

}
