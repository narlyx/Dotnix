{pkgs, ...}: {
  home.packages = with pkgs; [
    nmap
    exiftool
    maltego
  ];
}
