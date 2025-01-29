{ pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    walker
    playerctl
    brightnessctl
    jq
    grim
    slurp
    swappy
  ];

  home.file.".config/hypr" = {
    source = ../../../dotfiles/hyprland;
    recursive = true;
  };

}
