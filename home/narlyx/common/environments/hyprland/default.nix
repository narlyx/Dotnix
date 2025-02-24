{
  inputs,
  pkgs,
  ...
}: {
  # Imports
  imports = [
    # Backend
    inputs.ags.homeManagerModules.default
    ./hypr/autostart.nix
    ./hypr/binds.nix
    ./hypr/monitors.nix
    ./hypr/settings.nix
    ./hypr/input.nix

    # Packages
    ../../features/librewolf
    ../../features/ghostty
    ../../features/shell
    ../../features/git
    ../../features/neovim
    ../../features/syncthing
  ];

  # Packages
  home.packages = with pkgs; [
    # Desktop
    obsidian
    spotify
    vesktop
    neovide
    qbittorrent

    # Dependencies
    playerctl
    brightnessctl
    swww
    walker
    jq
    grim
    slurp
    swappy
    gtk3
    gtk4
  ];

  # Hyprland configuration
  wayland.windowManager.hyprland = {
    # Enabling hyprland for home-manager
    enable = true;
  };
  home.file.".config/hypr/screenshot.sh".source = ./hypr/screenshot.sh;

  # AGS configuration
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      battery
      hyprland
      tray
      wireplumber
      network
    ];
  };
}
