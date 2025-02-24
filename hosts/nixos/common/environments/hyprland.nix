{pkgs, ...}: {
  imports = [
    ../features/audio.nix
  ];
  environment.systemPackages = with pkgs; [wl-clipboard];
  programs.hyprland.enable = true;
}
