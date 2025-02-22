{
  wayland.windowManager.hyprland.settings = {
    # Look and feel
    general = {
      gaps_in = 5;
      gaps_out = 15;
      border_size = 0;
      resize_on_border = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.9;

      blur = {
        enabled = true;
        size = 10;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };

    # Input
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;
      accel_profile = "flat";
      touchpad = {
        natural_scroll = "yes";
        scroll_factor = 0.25;
      };
    };

    device = {
      name = "elan-touchpad";
      accel_profile = "adaptive";
      sensitivity = 0;
    };

    # Rules
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
