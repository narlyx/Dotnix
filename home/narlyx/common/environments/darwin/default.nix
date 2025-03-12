{pkgs, ...}: {
  imports = [
    ../../features/librewolf
    ../../features/ghostty
    ../../features/shell
    ../../features/syncthing
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
    utm
    qbittorrent
    raycast
    (brewCasks.keyboardcleantool.overrideAttrs (o: {
      src = pkgs.fetchurl {
        url = builtins.head o.src.urls;
        hash = "sha256-QQXyeWOwiBo5mtdwgVQYt2HXqkEu1jadgkaAnCKDsK4="; # Replace me with real hash after building once
      };
    }))

    # Literature
    brewCasks.koodo-reader
    brewCasks.calibre

    # IDE
    brewCasks.visual-studio-code
    brewCasks.android-studio
    neovide

    # Development
    nodejs
    jdk11
    android-tools
  ];
}
