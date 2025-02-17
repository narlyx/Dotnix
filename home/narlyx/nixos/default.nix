{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Desktop
    ./common/environments/hyprland

    # Shell
    ./common/features/nushell
    ./common/features/git

    # Development
    ./common/features/python
  ];

  home = {
    packages = with pkgs; [
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
