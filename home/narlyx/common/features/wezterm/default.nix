{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'catppuccin-mocha'
      config.window_background_opacity = 1
      config.hide_tab_bar_if_only_one_tab = true

      config.font = wezterm.font 'Fira Code'
      config.font_size = 11

      config.window_padding = {
        left = "2cell";
        right = "2cell";
        top = "1cell";
        bottom = "1cell";
      }

      return config
    '';
  };
}
