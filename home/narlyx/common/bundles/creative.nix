{pkgs, ...}: {
  home.packages = with pkgs; [
    krita
    gimp
    freecad
    prusa-slicer
  ];
}
