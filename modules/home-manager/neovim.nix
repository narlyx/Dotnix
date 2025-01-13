{ config, lib, pkgs, ... }:

{
  # Dependancies
  home.packages = with pkgs; [
    yarn
    go
    clang
  ];

  # Enabling neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  
  # Linking config
  home.file.".config/nvim" = {
    source = ../../dotfiles/neovim;
    recursive = true;
  };
}
