{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./common/wms/hyprland
  ];

  home = {
    packages = with pkgs; [
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
