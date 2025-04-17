{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
    workspace = [
      #"workspaceId, defaultName:newWorkspaceName"
    ];
  };
}
