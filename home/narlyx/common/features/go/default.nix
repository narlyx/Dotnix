{pkgs, ...}: {
  home.sessionVariables = {
    CGO_ENABLED = 1;
  };
  home.packages = with pkgs; [
    go
    gcc
  ];
}
