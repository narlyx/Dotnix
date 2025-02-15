{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./common/wms/hyprland
    ./common/features/python.nix
  ];

  home = {
    packages = with pkgs; [
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
