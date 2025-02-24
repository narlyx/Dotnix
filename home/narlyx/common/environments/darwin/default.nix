{pkgs, ...}: {
  imports = [
    ../../features/librewolf
    ../../features/ghostty
    ../../features/shell
    ../../features/git
    ../../features/neovim
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
