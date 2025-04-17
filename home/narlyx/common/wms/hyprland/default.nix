{pkgs, ...}: {
  # Dependancies
  home.packages = with pkgs; [
    playerctl
    brightnessctl
    swww
    grim
    slurp
    swappy
    jq
  ];

  # Enable hyprland
  wayland.windowManager.hyprland.enable = true;

  # Submodules
  imports = [
    # Hyprland configuration files
    ./config/autostart.nix
    ./config/binds.nix
    ./config/input.nix
    ./config/look.nix
    ./config/monitors.nix
    ./config/rules.nix

    # Application launcher
    ../../util/walker
  ];

  # Files
  home.file.".config/hypr/screenshot.sh".source = ./screenshot.sh;
}
