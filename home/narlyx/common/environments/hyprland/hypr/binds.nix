{
  wayland.windowManager.hyprland.settings = {
    # Modifiers
    "$mainMod" = "SUPER";
    "$altMod" = "ALT_L";

    # Binds
    bind = [
      # Applications
      "$mainMod, RETURN, exec, ghostty"
      "$mainMod, SPACE, exec, walker --modules applications"

      # General
      "$mainMod, Q, killactive,"
      "$mainMod, F, togglefloating,"
      "$mainMod SHIFT, F, fullscreen"
      "$mainMod, M, exit,"
      "$mainMod SHIFT, R, exec, hyprctl reload"

      # Navigation
      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      # Movement
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, J, movewindow, d"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, L, movewindow, r"

      # Workspace navigation
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Workspace movement
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod, left, workspace, e-1"
      "$mainMod, right, workspace, e+1"

      # Screenshot
      ", Print, exec, ~/.config/hypr/screenshot.sh region"
      "SHIFT, Print, exec, ~/.config/hypr/screenshot.sh window"
      "CTRL, Print, exec, ~/.config/hypr/screenshot.sh output"
      "CTRL SHIFT, Print, exec, ~/.config/hypr/screenshot.sh all"
    ];

    # Volume
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    # Switch
    bindl = [
      # Thinkpad lid
      ", switch:off:Lid Switch,exec,hyprctl keyword monitor 'eDP-1, 1920x1080, 0x0, 1'"
      ", switch:on:Lid Switch,exec,hyprctl keyword monitor 'eDP-1, disable'"

      # Multimedia
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"

      # Brightness
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    # Mouse
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
