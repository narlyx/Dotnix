{pkgs, ...}: {
  home.packages = with pkgs; [
    freecad
    prusa-slicer
  ];
}
