{ pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
    walker
    playerctl
    brightnessctl
    jq
    grim
    slurp
    swappy
    ags
  ];

  home.file.".config/hypr" = {
    source = ../../../dotfiles/hyprland;
    recursive = true;
  };

}
