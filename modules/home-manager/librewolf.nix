{ config, lib, pkgs, ... }:

{
  # Installing
  home.packages = with pkgs; [
    librewolf
  ];

  # Linking configuration
  home.file.".librewolf/librewolf.overrides.cfg" = {
    source = ../../dotfiles/librewolf/librewolf.overrides.cfg;
  };
}
