{ ... }:

{
  imports = [
    ./modules/default.nix
  ];
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
}
