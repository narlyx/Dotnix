{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
    ./features/desktop/common
    ./features/desktop/hyprland
  ];

  home = {
    username = "narlyx";
    homeDirectory = "/home/narlyx";

    packages = with pkgs; [
      # Tools
      ventoy-full

      # Office
      koodo-reader
      onlyoffice-desktopeditors

      # Devel
      python312
      android-tools
      android-studio

      # Graphics
      gimp
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
