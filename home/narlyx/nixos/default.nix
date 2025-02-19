{...}: {
  imports = [
    # Desktop
    ./common/environments/hyprland

    # Shell
    ./common/features/shell
    ./common/features/git
    ./common/features/neovim

    # Development
    ./common/features/python
  ];

  home = {
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
