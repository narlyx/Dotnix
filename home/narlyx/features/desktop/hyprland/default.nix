{ pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    walker
    playerctl
    brightnessctl
  ];

  home.file.".config/hypr" = {
    source = ../../../dotfiles/hyprland;
    recursive = true;
  };

}
