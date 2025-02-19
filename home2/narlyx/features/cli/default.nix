{pkgs, ...}: {
  # Other files
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  # Other tools
  home.packages = with pkgs; [
    # Achives/compression
    geteltorito
  ];
}
