{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 150;
        offset = "20x20";
        origin = "top-right";

        transparency = 5;
        padding = 10;
        vertical_alignment = "center";
        horizontal_alignment = "center";
      };
      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#6c7086";
        timeout = 10;
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#6c7086";
        timeout = 10;
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f5e0dc";
        timeout = 0;
      };
    };
  };
}
