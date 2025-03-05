{osConfig, ...}: let
  hostName = osConfig.networking.hostName;
in {
  # Terminal interface
  programs.spotify-player = {
    # Enabling spotify-player
    enable = true;

    # Player settings
    settings = {
      # Look and feel
      theme = "Catppuccin-Frappe";
      layout.playback_window_position = "Bottom";

      # Streaming
      default_device = hostName;

      # Device settings
      device = {
        name = hostName;
        device_type = "computer";
        volume = 90;
        bitrate = 320;
        audio_cache = false;
        normalization = true;
        autoplay = true;
      };
    };

    # Themes
    themes = [
      {
        name = "Catppuccin-Frappe";
        palette = {
          black = "#303446";
          blue = "#8caaee";
          cyan = "#99d1db";
          green = "#a6d189";
          magenta = "#ca9ee6";
          red = "#e78284";
          white = "#c6d0f5";
          yellow = "#e5c890";
          bright_black = "#303446";
          bright_blue = "#8caaee";
          bright_cyan = "#99d1db";
          bright_green = "#a6d189";
          bright_magenta = "#ca9ee6";
          bright_red = "#e78284";
          bright_white = "#c6d0f5";
          bright_yellow = "#e5c890";
        };
        component_style = {
          block_title = {fg = "Magenta";};
          border = {};
          playback_track = {
            fg = "Cyan";
            modifiers = ["Bold"];
          };
          playback_artists = {
            fg = "Cyan";
            modifiers = ["Bold"];
          };
          playback_album = {fg = "Yellow";};
          playback_metadata = {fg = "Blue";};
          playback_progress_bar = {
            bg = "#414559";
            fg = "Green";
          };
          current_playing = {
            fg = "Green";
            modifiers = ["Bold"];
          };
          page_desc = {
            fg = "Cyan";
            modifiers = ["Bold"];
          };
          table_header = {fg = "Blue";};
          selection = {
            bg = "#414559";
            modifiers = ["Bold"];
          };
          playlist_desc = {
            fg = "Cyan";
            modifiers = ["Italic"];
          };
        };
      }
    ];
  };
}
