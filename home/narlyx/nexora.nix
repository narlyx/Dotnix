{pkgs, ...}: {
  imports = [
    ./default.nix
    ./common/apps/ghostty
    ./common/devel
    ./common/services/syncthing.nix
    ./common/desktops/hyprland
  ];
  home.packages = with pkgs; [
    firefox
    spotify
    vesktop
    obsidian
    onlyoffice-desktopeditors
    zoom-us
    qbittorrent
    krita
    gimp
    freecad
    prusa-slicer
  ];
}
