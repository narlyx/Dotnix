{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    exfat
    unzip
    tree
    htop
  ];
}
