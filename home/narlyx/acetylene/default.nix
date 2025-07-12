{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/bundles/code.nix
    ../common/environments/i3
    ../common/features/wezterm
    ../common/features/syncthing
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
    mysql-workbench
    strawberry
    davinci-resolve
    vlc

    prismlauncher
    rpcs3
  ];
}
