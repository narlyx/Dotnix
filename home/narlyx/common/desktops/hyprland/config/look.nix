{
  wayland.windowManager.hyprland.settings = {
    # General settings
    general = {
      gaps_in = 5;
      gaps_out = 15;
      border_size = 0;
      resize_on_border = false;
      layout = "dwindle";
    };

    # Window decoration
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
    
    # Dwindle layout
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    # Misc
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
  };
}
