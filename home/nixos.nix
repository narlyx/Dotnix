{ config, pkgs, ... }:

{
  # Other files
  imports = [
    # Command line
    ../modules/home-manager/nushell.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/tmux.nix

    # Desktop
    ../modules/home-manager/i3.nix

    # Applications
    ../modules/home-manager/librewolf.nix
    ../modules/home-manager/ghostty.nix

    # Services
    ../modules/home-manager/syncthing.nix
  ];

  # Home configuration
  home = {
    # User
    username = "narlyx";
    homeDirectory = "/home/narlyx";

    # User packages
    packages = with pkgs; [
      obsidian
      spotify
      vesktop
    ];
    
    # Version
    stateVersion = "24.11";
  };

  # Enabling self
  programs.home-manager.enable = true;
}
