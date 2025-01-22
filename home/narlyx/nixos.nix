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

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
