{ config, pkgs, ... }:

{
  # Other modules
  imports = [
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/wezterm.nix
  ];

  # Home configuration
  home = {
    # User
    username = "narlyx";
    homeDirectory = "/Users/narlyx";

    # User packages
    packages = with pkgs; [
      arc-browser
      obsidian
      vesktop
      spotify
      raycast
      android-tools
    ];

    # Version
    stateVersion = "24.11";
  };

  # User services
  services = {
    syncthing = {
      enable = true;
    };
  };

  # Enabling self
  programs.home-manager.enable = true;
}
    
