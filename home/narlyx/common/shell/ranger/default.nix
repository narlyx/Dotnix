{pkgs, ...}: {
  # Dependancies
  home.packages = with pkgs; [
    xdragon
  ];

  # Scripts
  home.file.".config/ranger/dragon-wrapper.sh".source = ./dragon-wrapper.sh;

  # Configuring ranger
  programs.ranger = {
    # Enabling
    enable = true;

    # Keybinds
    mappings = {
      # Drag and drop
      "<C-d>" = "shell ~/.config/ranger/dragon-wrapper.sh -a -x %p";
    };
  };
}
