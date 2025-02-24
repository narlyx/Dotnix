{...}: {
  imports = [
    # Desktop
    ../common/environments/hyprland

    # Development
    ../common/features/python
  ];
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
