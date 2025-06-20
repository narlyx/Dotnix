{pkgs, ...}: {
  # Dependencies
  home.packages = with pkgs; [
    walker
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

    # Other dependencies
    ./waybar
  ];

  # Files
  home.file.".config/hypr/screenshot.sh".source = ./screenshot.sh;

  # Theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 16;
    };
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-frappe-blue-standard";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "Catppuccin-Frappe";
    };
  };
}
