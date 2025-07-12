{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "narlyx";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${config.home.username}"
      else "/home/${config.home.username}";
    stateVersion = "25.05";
  };
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
