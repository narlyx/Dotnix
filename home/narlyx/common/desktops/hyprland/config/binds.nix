{
  wayland.windowManager.hyprland.settings = {
    # Modifer vars
    "$mod" = "SUPER";

    # Application vars
    "$terminal" = "ghostty";
    "$launcher" = "walker --modules applications";

    # Keybinds
    bind = [
      # Applications
      "$mod, RETURN, exec, $terminal"
      "$mod, SPACE, exec, $launcher"

      # General
      "$mod, Q, killactive," # Kill focused window
      "$mod, T, togglefloating," # Toggle floating
      "$mod, F, fullscreen" # Toggle fullscreen
      "$mod CTRL, Q, exit," # Quit hyprland
      "$mod SHIFT, R, exec, hyprctl reload" # Reload config

      # Screenshot
      ", PRINT, exec, ~/.config/hypr/screenshot.sh region"
      "SHIFT, PRINT, exec, ~/.config/hypr/screenshot.sh window"
      "CTRL, PRINT, exec, ~/.config/hypr/screenshot.sh output"
      "CTRL SHIFT, PRINT, exec, ~/.config/hypr/screenshot.sh all"

      # Navigation
      "$mod, H, movefocus, l" # Move focus left
      "$mod, J, movefocus, d" # Move focus down
      "$mod, K, movefocus, u" # Move focus up
      "$mod, L, movefocus, r" # Move focus right

      # Movement
      "$mod SHIFT, H, movewindow, l" # Move window left
      "$mod SHIFT, J, movewindow, d" # Move window down
      "$mod SHIFT, K, movewindow, u" # Move window up
      "$mod SHIFT, L, movewindow, r" # Move window right

      # Worksapce navigation
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod, LEFT, workspace, e-1"
      "$mod, RIGHT, workspace, e-1"

      # Workspace movement
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod SHIFT, LEFT, movetoworkspace, e-1"
      "$mod SHIFT, RIGHT, movetoworkspace, e-1"
    ];

    # Volume bindings
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    # Switch bindings
    bindl = [
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

    # Mouse bindings
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
