{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    fzf
  ];

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
  };
}
