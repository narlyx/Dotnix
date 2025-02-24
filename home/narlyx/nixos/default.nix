{...}: {
  imports = [
    # Desktop
    ../common/environments/hyprland

    # Development
    ../common/features/python
    ../common/features/go
  ];
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
