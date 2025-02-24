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

    # Desktop apps
    ../../features/librewolf
  ];

  # Packages
  home.packages = with pkgs; [
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
