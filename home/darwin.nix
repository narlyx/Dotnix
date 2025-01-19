{ inputs, config, pkgs, ... }:

{
  # Other modules
  imports = [
    # Command line
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/nushell.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/tmux.nix

    # Applications
    ../modules/home-manager/ghostty-darwin.nix
    
    # Services
    ../modules/home-manager/syncthing.nix
  ];

  # Brew-nix
  nixpkgs = {
    overlays = [
      inputs.brew-nix.overlays.default
    ];
  };

  # Home configuration
  home = {
    # User
    username = "narlyx";
    homeDirectory = "/Users/narlyx";

    # User packages
    packages = with pkgs; [
      # Common
      brewCasks.zen-browser
      obsidian
      vesktop
      spotify
      
      # Utilities
      raycast

      # Development
      nodejs
      jdk11
      gradle
      android-tools
      brewCasks.android-studio
      brewCasks.visual-studio-code
      brewCasks.gimp
      brewCasks.krita
      neovide
    ];

    # Version
    stateVersion = "24.11";
  };
  
  # Enabling self
  programs.home-manager.enable = true;
}
    
