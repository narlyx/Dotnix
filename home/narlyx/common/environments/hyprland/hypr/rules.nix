{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
    workspace = [
      ", defaultName:???"
      "1, defaultName:www"
      "2, defaultName:term"
      "3, defaultName:dev"
      "4, defaultName:doc"
      "5, defaultName:media"
    ];
  };
}
