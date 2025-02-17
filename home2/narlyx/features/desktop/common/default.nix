{ pkgs, ... }:

{
  imports = [
    ./ghostty.nix
  ];

  home.packages = with pkgs; [
    obsidian
    spotify
    vesktop
    neovide
    qbittorrent
  ];

  services = {
    syncthing = {
      enable = true;
    };
  };
}
