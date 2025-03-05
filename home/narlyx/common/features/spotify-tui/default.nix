{osConfig, ...}: {
  # Terminal interface
  programs.spotify-player = {
    enable = true;
    settings = {
      layout.playback_window_position = "Bottom";
      device = {
        name = osConfig.networking.hostName;
        device_type = "computer";
        volume = 75;
        bitrate = 320;
        audio_cache = false;
        normalization = true;
        autoplay = true;
      };
    };
  };
}
