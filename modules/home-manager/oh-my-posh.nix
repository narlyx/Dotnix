{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-posh
  ];

  home.file.".config/oh-my-posh/config.json" = {
    source = ../../dotfiles/oh-my-posh/config.json;
  };
}

