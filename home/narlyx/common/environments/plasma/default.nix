{pkgs, ...}: {
  imports = [
    ../../features/librewolf
    ../../features/wezterm
    ../../features/shell
    ../../features/syncthing
  ];

  home.packages = with pkgs; [
    obsidian
  ];
}
