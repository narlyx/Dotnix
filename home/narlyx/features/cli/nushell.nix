{ pkgs, ... }:

{
  # Other files
  imports = [ ./oh-my-posh.nix ];

  # Dependancies
  home.packages = with pkgs; [
    zoxide
  ];

  # Configuring nushell
  programs.nushell = {
    enable = true;
    configFile.source = ../../dotfiles/nushell/config.nu;
    envFile.source = ../../dotfiles/nushell/env.nu;
  };
}
