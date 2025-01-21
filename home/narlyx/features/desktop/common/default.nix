{ pkgs, ... }:

{
  imports = [
    ./ghostty.nix
    ./librewolf.nix
  ];

  home.packages = with pkgs; [
    obsidian
    spotify
    vesktop
    neovide
  ];

  services = {
    syncthing = {
      enable = true;
    };
  };
}
