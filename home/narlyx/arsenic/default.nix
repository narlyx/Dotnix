{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/bundles/code.nix

    ../common/features/ghostty
    ../common/features/syncthing
  ];

  home.packages = with pkgs; [
    brave
    firefox
    spotify
    vesktop
    obsidian
    brewCasks.onlyoffice
  ];
}
