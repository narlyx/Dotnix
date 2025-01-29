{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
    ./features/desktop/common
    ./features/desktop/hyprland
  ];

  home = {
    username = "narlyx";
    homeDirectory = "/home/narlyx";

    packages = with pkgs; [
      ventoy-full
      koodo-reader
      onlyoffice-desktopeditors
      python312
      android-tools
      android-studio
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
