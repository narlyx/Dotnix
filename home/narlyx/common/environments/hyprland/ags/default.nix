{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    enable = true;
    configDir = ./.;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      hyprland
    ];
  };
}
