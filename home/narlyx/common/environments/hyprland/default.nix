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
    zoom-us
    anytype

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

  # Theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
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
