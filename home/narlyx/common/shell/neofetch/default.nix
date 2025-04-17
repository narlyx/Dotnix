{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    imagemagick
    viu
  ];
  home.file.".config/neofetch/config.conf".source = ./config.conf;
}
