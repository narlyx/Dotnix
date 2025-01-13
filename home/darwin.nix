{ inputs, config, pkgs, ... }:

{
  # Other modules
  imports = [
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/wezterm.nix
    ../modules/home-manager/tmux.nix
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
      brewCasks.zen-browser
      obsidian
      vesktop
      spotify
      raycast
      android-tools
      brewCasks.android-studio
      brewCasks.visual-studio-code
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
    
