{
  wayland.windowManager.hyprland.settings = {
    # General input settings
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

    # Custom T480S touchpad
    device = {
      name = "synaptics-tm3293-011";
      accel_profile = "adaptive";
      sensitivity = 0;
    };
  };
}
