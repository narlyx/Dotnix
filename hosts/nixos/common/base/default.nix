{
  imports = [
    ./bootloader.nix
    ./extraPackages.nix
    ./input.nix
    ./locale.nix
    ./networking.nix
    ./settings.nix
    ../users/root.nix
    ../features/ssh.nix
    ../../../../secrets
  ];
}
