{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    exfat
    geteltorito
    unzip
  ];
}
