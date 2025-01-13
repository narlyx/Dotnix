{ config, lib, pkgs, ... }:

{
  # Other modules
  imports = [
    ./oh-my-posh.nix
  ];

  # Dependancies
  home.packages = with pkgs; [
    zoxide
  ];

  # Enabling nushell
  programs.nushell = {
    enable = true;
    configFile.source = ../../dotfiles/nushell/config.nu;
    envFile.source = ../../dotfiles/nushell/env.nu;
  };
}
