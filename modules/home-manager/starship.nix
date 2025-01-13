{ config, lib, pkgs, ... }:

{
  # Installing starship
  home.packages = with pkgs; [
    starship
  ];
  
  # Linking config
  home.file.".config/starship.toml" = {
    source = ../../dotfiles/starship/starship.toml;
  };
}
