{
  pkgs,
  ...
}: {
  imports = [
    ../features/audio.nix
  ];
  programs.hyprland.enable = true;
}
