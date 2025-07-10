{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./default.nix
    ./common/desktops/aerospace
    ./common/apps/ghostty
    ./common/devel
    ./common/services/syncthing.nix
    inputs.mac-app-util.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    firefox
    spotify
    vesktop
    obsidian
    brewCasks.onlyoffice
    raycast
    qbittorrent
    brewCasks.krita
    brewCasks.mysqlworkbench
    emacs
  ];
}
