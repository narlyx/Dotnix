{ config, lib, pkgs, ... }:

{
  # Enabling wezterm
  programs.wezterm.enable = true;

  # Linking config
  home.file.".config/wezterm" = {
   source = ../../dotfiles/wezterm;
   recursive = true;
  };
}
