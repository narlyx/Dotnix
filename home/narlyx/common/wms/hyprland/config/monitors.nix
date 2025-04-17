{osConfig, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor =
      # Acetylene
      if osConfig.networking.hostName == "acetylene"
      then [
        #"HDMI-A-1, 1920x1080@74.97Hz, 0x0, 1"
        #"DP-3, 1920x1080@74.97Hz, -1920x0, 1"
        #"DP-2, 1600x900, -275x-900, 1"
        "HDMI-A-1, 1920x1080@100.00Hz, 0x0, 1"
      ]

      # Nexora
      else if osConfig.networking.hostName == "nexora"
      then [
        "eDP-1, 1920x1080, 0x0, 1"
      ]
      else [];
  };
}
