{pkgs, ...}: {
  # Other files
  imports = [
  ];

  # Other tools
  home.packages = with pkgs; [
    # Achives/compression
    geteltorito
  ];
}
