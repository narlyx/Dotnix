{
  wayland.windowManager.hyprland.settings = {
    exec = [
      "tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE '$HYPRLAND_INSTANCE_SIGNATURE'"
      "ags quit"
      "ags run"
    ];
    exec-once = [
      "walker --gapplication-service"
      "swww-daemon"
    ];
  };
}
