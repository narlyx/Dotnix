{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      top_padding = 20;
      bottom_padding = 20;
      left_padding = 20;
      right_padding = 20;
      window_gap = 10;
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      focus_follows_mouse = "autofocus";
      mouse_follows_focus = true;
      window_opacity = true;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
    };
  };
}
