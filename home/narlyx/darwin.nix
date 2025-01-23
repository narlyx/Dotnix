{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
    ./features/cli/nushell.nix
    ./features/desktop/darwin
  ];

  nixpkgs = {
    overlays = [
      inputs.brew-nix.overlays.default
    ];
  };

  home = {
    username = "narlyx";
    homeDirectory = "/Users/narlyx";

    packages = with pkgs; [
      # Desktop
      brewCasks.qflipper
      utm

      # IDE
      brewCasks.visual-studio-code
      brewCasks.android-studio

      # Devel
      nodejs
      jdk11
      #gradle
      android-tools
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
