{pkgs, ...}: {
  # Modules
  imports = [
    ./default.nix # Extend default
    ../common/devel # Development tools
    ../common/wms/hyprland # Window manager
    ../common/apps/ghostty # Terminal
    ../common/apps/librewolf # Browser
    ../common/services/syncthing # File sync
  ];

  # Packages
  home.packages = with pkgs; [
    # Media
    spotify

    # Communication
    vesktop

    # Office
    obsidian
    onlyoffice-desktopeditors
    zoom-us

    # Utilities
    qbittorrent
  ];

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
