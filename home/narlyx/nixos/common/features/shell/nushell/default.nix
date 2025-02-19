{pkgs, ...}: {
  home.packages = with pkgs; [
    zoxide
    bat
    fzf
  ];

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
  };
}
