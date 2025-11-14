{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    tree
    git
    vim
    htop
    progress
    file
  ];
}
