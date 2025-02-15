{ pkgs, ... }:

{
  # Other files
  imports = [
    ./oh-my-posh.nix
  ];

  # Dependancies
  home.packages = with pkgs; [
    zoxide
    eza
    bat
    fzf
    thefuck
    libnotify
  ];

  # Enabling zsh
  programs.zsh.enable = true;
  
  # Linking config
  home.file.".zshrc" = {
    source = ../../dotfiles/zsh/zshrc;
  };
}
