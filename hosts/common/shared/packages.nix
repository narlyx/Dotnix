{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    tree
    git
    vim
    htop
    progress
    file
    zip
    unzip
    cifs-utils
  ];
}
