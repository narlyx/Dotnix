{...}: {
  imports = [
    # Desktop
    ../common/environments/hyprland

    # Development
    ../common/features/python
    ../common/features/go
    ../common/features/sqlite
  ];
  home.stateVersion = "24.11";
}
