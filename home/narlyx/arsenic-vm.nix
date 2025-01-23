{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
  ];

  home = {
    username = "narlyx";
    homeDirectory = "/home/narlyx";

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
