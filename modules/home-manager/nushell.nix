{ config, lib, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  home.packages = with pkgs; [
    zoxide
  ];

  programs.starship.enable = true;
  programs.nushell = {
    enable = true;
    configFile.source = ../../dotfiles/nushell/config.nu;
    envFile.source = ../../dotfiles/nushell/env.nu;
  };
}
