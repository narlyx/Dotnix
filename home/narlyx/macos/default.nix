{pkgs, ...}: {
  imports = [
    ../common/shell # Default shell
    ../common/apps/librewolf # Browser
    ../common/apps/ghostty # Terminal
    ../common/apps/wezterm # Another terminal
    ../common/services/syncthing # File sync
    ../common/devel # Development defaults
    ../common/apps/vscode # IDE
  ];

  # Packages
  home.packages = with pkgs; [
    # Media
    spotify

    # Comms
    vesktop

    # Office
    obsidian
    zoom-us
    brewCasks.onlyoffice

    # Util
    raycast
    qbittorrent
    brewCasks.qflipper
    (brewCasks.keyboardcleantool.overrideAttrs (o: {
      src = pkgs.fetchurl {
        url = builtins.head o.src.urls;
        hash = "sha256-QQXyeWOwiBo5mtdwgVQYt2HXqkEu1jadgkaAnCKDsK4=";
      };
    }))

    # Creative
    brewCasks.krita

    # Devel
    brewCasks.mysqlworkbench
    brewCasks.android-studio
    jdk11
    android-tools
  ];

  # Version
  home.stateVersion = "25.05";
}
