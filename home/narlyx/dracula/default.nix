{pkgs, ...}: {
  imports = [
    ../common/base
    ../common/bundles/shell.nix
    ../common/environments/i3
    ../common/features/wezterm
  ];

  programs.autorandr = {
    enable = true;
    profiles = {
      "default" = {
        fingerprint = {
          eDP-1 = "--CONNECTED-BUT-EDID-UNAVAILABLE--eDP-1";
        };
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            mode = "2560x1600";
            rate = "60.00";
            position = "0x0";
            scale = {
              x = 0.82;
              y = 0.82;
            };
          };
        };
      };
    };
  };

  home.packages = with pkgs; [
    brave
    vesktop
  ];
}
