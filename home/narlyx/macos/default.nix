{...}: {
  imports = [
    # Desktop
    ../common/environments/darwin

    # Development
    ../common/features/python
  ];
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
