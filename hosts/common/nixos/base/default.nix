{
  imports = [
    ../system/locale.nix
    ../system/networking.nix
    ../users/root.nix
    ../../shared/settings.nix
  ];

  system.stateVersion = "25.05";
}
