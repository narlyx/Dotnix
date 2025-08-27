{pkgs, ...}: {
  imports = [
    ../features/gpg.nix
    ../features/ssh.nix
  ];
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    exfat
    unzip
    tree
    htop
    tmux
    libnotify
    progress
    file
    cifs-utils
    lftp
  ];
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];
}
