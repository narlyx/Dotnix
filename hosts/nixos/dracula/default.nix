{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
    ../common/base
    ../common/users/narlyx.nix
    ../common/environments/xorg.nix
  ];

  networking.hostName = "dracula";
}
