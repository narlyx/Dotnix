{pkgs, ...}: {
  imports = [
    ../../features/librewolf
    ../../features/wezterm
    ../../features/shell
    ../../features/git
    ../../features/neovim
    ../../features/syncthing
  ];

  home.packages = with pkgs; [
    obsidian
  ];
}
