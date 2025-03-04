{
  inputs,
  pkgs,
  ...
}: {
  # Other modules
  imports = [
    ./hypr
    ./ags
    ../../features/librewolf
    ../../features/ghostty
    ../../features/shell
    ../../features/syncthing
  ];

  # Packages
  home.packages = with pkgs; [
    obsidian
    spotify
    vesktop
    neovide
    qbittorrent
    zoom-us
  ];

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # Gtk theme
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

  # Qt theme
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "Catppuccin-Frappe";
    };
  };
}
