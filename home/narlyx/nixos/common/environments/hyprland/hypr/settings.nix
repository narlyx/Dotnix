{
  wayland.windowManager.hyprland.settings = {
    # Monitors
    monitor = [
      # Other
      ", preferred, auto, 1"

      # Thinkpad
      "eDP-1, 1920x1080, 0x0, 1"
      "DP-2, 1920x1080@100.00Hz, 0x-180, 1"
    ];

    # Autostart
    exec = [
      "tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE '$HYPRLAND_INSTANCE_SIGNATURE'"
      "ags quit"
      "ags run"
    ];
    exec-once = [
      "walker --gapplication-service"
      "swww-daemon"
    ];

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

    # Rules
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
