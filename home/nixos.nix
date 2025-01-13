{ config, pkgs, ... }:

{
  # Other files
  imports = [
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/tmux.nix
  ];

  # Home configuration
  home = {
    # User
    username = "narlyx";
    homeDirectory = "/home/narlyx";
    
    # Version
    stateVersion = "24.11";
  };

  # Enabling self
  programs.home-manager.enable = true;
}
