
{ config, lib, pkgs, ... }:

{
  # Installing ghostty
  home.packages = with pkgs; [
    brewCasks.ghostty
  ];

  # Linking config
  home.file.".config/ghostty/config" = {
    source = ../../dotfiles/ghostty/config;
  };
}
