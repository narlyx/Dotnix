{pkgs, ...}: {
  home.packages = [
    (pkgs.python312.withPackages (p:
      with p; [
        build
        requests
        tkinter
        typer
        pip
        numpy
        matplotlib
      ]))
  ];
}
