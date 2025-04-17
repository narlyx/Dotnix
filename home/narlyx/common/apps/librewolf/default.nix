{pkgs, ...}: {
  home.packages =
    if pkgs.stdenv.isDarwin
    then [pkgs.brewCasks.librewolf]
    else [pkgs.librewolf];
  home.file.".librewolf/librewolf.overrides.cfg".source = ./librewolf.overrides.cfg;
}
