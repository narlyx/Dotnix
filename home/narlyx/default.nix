{inputs, config, pkgs, ...}: {
  imports = [
    ./common/shell
  ];

  home = {
    username = "narlyx";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
