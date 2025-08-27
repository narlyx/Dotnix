{pkgs, ...}: {
  home.packages = with pkgs; [
    # Enumeration
    gobuster
    dirb
    nmap
  ];
}
