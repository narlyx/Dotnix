{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
    ./features/desktop/common
    ./features/desktop/i3
  ];

  home = {
    username = "narlyx";
    homeDirectory = "/home/narlyx";

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
