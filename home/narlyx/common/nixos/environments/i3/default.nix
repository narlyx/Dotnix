{ pkgs, ... }: let
  wallpaper = ./wallpaper.jpg;
  wallpaperPath = toString wallpaper;
in {
  imports = [
    ./dunst
  ];
  home.packages = with pkgs; [
    playerctl
    brightnessctl
    flameshot
    xsel
  ];
  home.file.".config/i3/config".text = ''
    # Autostart
    exec --no-startup-id dev --autostart --environment i3
    exec --no-startup-id ${pkgs.picom}/bin/picom --config ~/.config/picom/picom.conf -b
    exec_always --no-startup-id sh -c '${pkgs.autorandr}/bin/autorandr -c && ${pkgs.feh}/bin/feh --bg-fill ${wallpaper}';

    # Variables
    set $mod Mod4

    # Programs
    set $terminal ghostty
    set $launcher ${pkgs.dmenu}/bin/dmenu_run

    # Workspaces
    set $ws1 "1"
    set $ws2 "2"
    set $ws3 "3"
    set $ws4 "4"
    set $ws5 "5"
    set $ws6 "6"
    set $ws7 "7"
    set $ws8 "8"
    set $ws9 "9"
    set $ws10 "10"

    # Look
    ## Gaps
    gaps inner 10px
    gaps outer 20px

    ## Borders
    for_window [class="^.*"] border pixel 0

    # Binds
    ### Window dragging
    floating_modifier $mod

    ## Move tiling windows via mouse
    tiling_drag modifier titlebar

    ## Programs
    bindsym $mod+Return exec $terminal
    bindsym $mod+space exec $launcher

    ## Kill focused window
    bindsym $mod+q kill
  
    ## Change focus
    bindsym $mod+h focus left 
    bindsym $mod+j focus down 
    bindsym $mod+k focus up 
    bindsym $mod+l focus right 
 
    ## Move focused window
    bindsym $mod+Shift+h move left 
    bindsym $mod+Shift+j move down 
    bindsym $mod+Shift+k move up 
    bindsym $mod+Shift+l move right 
 
    ## Resize selected window
    bindsym $mod+Ctrl+h resize shrink width 10px or 10 ppt
    bindsym $mod+Ctrl+j resize shrink height 10px or 10 ppt
    bindsym $mod+Ctrl+k resize grow height 10px or 10 ppt
    bindsym $mod+Ctrl+l resize grow width 10px or 10 ppt
 
    ## Window split direction
    bindsym $mod+Shift+bar split h
    bindsym $mod+Shift+backslash split v
 
    ## Layouts
    bindsym $mod+f fullscreen toggle 
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split
    bindsym $mod+t floating toggle
    bindsym $mod+Shift+t focus mode_toggle
 
    ## Switching workspaces
    bindsym $mod+1 workspace number $ws1
    bindsym $mod+2 workspace number $ws2
    bindsym $mod+3 workspace number $ws3
    bindsym $mod+4 workspace number $ws4
    bindsym $mod+5 workspace number $ws5
    bindsym $mod+6 workspace number $ws6
    bindsym $mod+7 workspace number $ws7
    bindsym $mod+8 workspace number $ws8
    bindsym $mod+9 workspace number $ws9
    bindsym $mod+0 workspace number $ws10
 
    ## Move window to workspace
    bindsym $mod+Shift+1 move container to workspace number $ws1
    bindsym $mod+Shift+2 move container to workspace number $ws2
    bindsym $mod+Shift+3 move container to workspace number $ws3
    bindsym $mod+Shift+4 move container to workspace number $ws4
    bindsym $mod+Shift+5 move container to workspace number $ws5
    bindsym $mod+Shift+6 move container to workspace number $ws6
    bindsym $mod+Shift+7 move container to workspace number $ws7
    bindsym $mod+Shift+8 move container to workspace number $ws8
    bindsym $mod+Shift+9 move container to workspace number $ws9
    bindsym $mod+Shift+0 move container to workspace number $ws10
 
    ## Media keys
    bindsym XF86AudioMute exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    bindsym XF86AudioMicMute exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    bindsym XF86AudioRaiseVolume exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    bindsym XF86AudioLowerVolume exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    bindsym XF86AudioNext exec "playerctl next"
    bindsym XF86AudioPause exec "playerctl play-pause"
    bindsym XF86AudioPlay exec "playerctl play-pause"
    bindsym XF86AudioPrev exec "playerctl previous"
    bindsym XF86MonBrightnessUp exec "brightnessctl s 10%+"
    bindsym XF86MonBrightnessDown exec "brightnessctl s 10%-"
 
    # Screenshot
    bindsym Print exec "flameshot gui"
 
    ## Reload i3
    bindsym $mod+Shift+c reload
    bindsym $mod+Shift+r restart

    ## Exit
    bindsym $mod+Shift+e exec "i3-msg exit"

    # Rules
    focus_on_window_activation none
  '';

  home.file.".config/picom/picom.conf".text = ''
    backend = "glx";
    vsync = true;

    active-opacity = 1.0;
    inactive-opacity = 0.85;
    inactive-dim = 0.25;

    opacity-rule = [
      "100:focused"
    ];
  '';

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-frappe-blue-standard";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "Catppuccin-Frappe";
    };
  };
}
