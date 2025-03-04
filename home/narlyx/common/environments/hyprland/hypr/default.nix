{pkgs, ...}: {
  # Other modules
  imports = [
    ./autostart.nix
    ./binds.nix
    ./input.nix
    ./look.nix
    ./monitors.nix
    ./rules.nix
  ];

  # Files
  home.file.".config/hypr/screenshot.sh".source = ./scripts/screenshot.sh;

  # Enabling Hyprland
  wayland.windowManager.hyprland.enable = true;

  # Dependencies
  home.packages = with pkgs; [
    playerctl
    brightnessctl
    swww
    walker
    jq
    grim
    slurp
    swappy
  ];
}
