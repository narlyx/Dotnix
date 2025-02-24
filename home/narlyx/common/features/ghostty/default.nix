{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      background-opacity = 0.9;
      background-blur-radius = 20;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11;
      cursor-style = "bar";
      cursor-opacity = 0.75;
      gtk-titlebar = false;
      macos-option-as-alt = true;
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      window-decoration = true;
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;
      auto-update = "check";
      auto-update-channel = "stable";
      shell-integration-features = "no-cursor";
    };
    package =
      if pkgs.stdenv.isDarwin
      then pkgs.brewCasks.ghostty
      else pkgs.ghostty;
  };
}
