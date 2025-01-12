{ config, lib, pkgs, ... }:

{
  # Enabling starship
  programs.starship.enable = true;
  
  # Linking config
  home.file.".config/starship.toml" = {
    source = ../../dotfiles/starship/starship.toml;
  };
}
