{pkgs, ...}: {
  # Other modules
  imports = [
    ../../features/librewolf
    ../../features/wezterm
    ../../features/shell
    ../../features/syncthing
  ];

  # Packages
  home.packages = with pkgs; [
    obsidian
    spotify
    vesktop
    qbittorrent
    zoom-us
    strawberry
    onlyoffice-desktopeditors
  ];
}
