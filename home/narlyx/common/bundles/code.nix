{pkgs, ...}: {
  imports = [
    ../features/python
    ../features/node
  ];

  home.packages = with pkgs; [
    gcc
  ];
}
