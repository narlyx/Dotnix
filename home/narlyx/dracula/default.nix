{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/environments/i3
    ../common/features/wezterm
  ];

  home.packages = with pkgs; [
    brave
  ];
}
