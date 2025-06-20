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
          format = "{:%a %b %m %I:%M %p}";
          tooltip = false;
        };
      }
    ];
  };
}
