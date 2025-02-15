{ pkgs, ... }:

{
  home.packages = if pkgs.stdenv.isDarwin then [ pkgs.brewCasks.ghostty ] else [ pkgs.ghostty ];

  home.file.".config/ghostty/config".source = ../../../dotfiles/ghostty/config;
}
