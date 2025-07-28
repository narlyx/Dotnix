{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/bundles/code.nix
    ../common/environments/i3

    ../common/features/wezterm
    ../common/features/ghostty
    ../common/features/syncthing
  ];

  home.packages = with pkgs; [
    firefox
    spotify
    vesktop
    obsidian

    strawberry
    rockbox-utility
  ];
}
