{pkgs, ...}: {
  imports = [
    ../../features/librewolf
    ../../features/ghostty
    ../../features/wezterm
    ../../features/shell
    ../../features/syncthing
    ../../features/vscode
  ];
  home.packages = with pkgs; [
    # Media
    spotify

    # Communication
    vesktop
    zoom-us

    # Utilities
    obsidian
    brewCasks.qflipper
    qbittorrent
    raycast
    (brewCasks.keyboardcleantool.overrideAttrs (o: {
      src = pkgs.fetchurl {
        url = builtins.head o.src.urls;
        hash = "sha256-QQXyeWOwiBo5mtdwgVQYt2HXqkEu1jadgkaAnCKDsK4="; # Replace me with real hash after building once
      };
    }))
    brewCasks.onlyoffice
    brewCasks.mysqlworkbench

    # IDE
    brewCasks.android-studio
    neovide

    # Development
    nodejs
    jdk11
    android-tools
  ];
}
