{ pkgs, ... }:

{
  # Other files
  imports = [
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  # Other tools
  home.packages = with pkgs; [
    # Packages here
  ];
}
