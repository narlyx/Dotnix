{ home-manager, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
