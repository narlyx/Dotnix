{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    unzip
    tree
    htop
  ];
}
