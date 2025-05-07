{pkgs, ...}: {
  imports = [
    ./default.nix
    ./common/wms/hyprland
    ./common/apps/librewolf
    ./common/apps/ghostty
    ./common/devel
    ./common/services/syncthing.nix
  ];
  home.packages = with pkgs; [
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
