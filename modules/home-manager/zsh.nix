{ config, lib, pkgs, ... }:

{
  # Other used modules
  imports = [
    ./starship.nix
  ];

  # Packages
  home.packages = with pkgs; [
    # Dependancies
    zoxide
    eza
    bat
    fzf
    thefuck
  ];

  # Enabling zsh
  programs.zsh.enable = true;
  
  # Linking config
  home.file.".zshrc" = {
    source = ../../dotfiles/zsh/zshrc;
  };
}
