{
  programs.waybar = {
    enable = true;
    settings = [
      {
        # General
        layer = "top";
        position = "top";
        height = 30;
        margin-left = 50;
        margin-right = 50;

        # Module placement
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "battery"
          "wireplumber"
          "clock"
        ];

        # Module customization
        "clock" = {
          interval = 30;
          format = "[ {:%a %b %m %I:%M %p} ]";
          tooltip = false;
        };
        "battery" = {
          format = "[ Bat: {capacity}% ]";
        };
        "wireplumber" = {
          format = "[ Vol: {volume}% ]";
          max-volume = 100.0;
          reverse-scrolling = true;
        };
      }
    ];
    style = ''
      * {
        border-radius: 0;
        border: none;
        margin: 0;
        color: #c6d0f5;
      }
      window#waybar {
        border-radius: 0 0 10px 10px;
        background-color: #303446;
      }
      window#waybar>box {
        padding: 0 10px 2px 10px;
      }
      .module {
        padding: 0 10px;
        background-color: #414559;
      }
      #workspaces {
        padding: 0 4px;
        border-radius: 0 0 10px 10px;
      }
      #clock {
        border-radius: 0 0 10px 0;
      }
      #battery {
        border-radius: 0 0 0 10px;
      }
      #tray {
        margin-right: 10px;
        border-radius: 0 0 10px 10px;
      }
    '';
  };
}
