let
  wallpaper = builtins.toString ../../../../../../assets/wallpapers/DarkestHour.jpg;
in {
  wayland.windowManager.hyprland.settings = {
    exec = [
      "tmux setenv -g HYPRLAND_ISNTANCE_SIGNATURE '$HYPRLAND_INSTANCE_SIGNATURE'"
    ];
    exec-once = [
      "walker --gapplication-service"
      "swww-daemon"
      "swww img ${wallpaper}"
    ];
  };
}

