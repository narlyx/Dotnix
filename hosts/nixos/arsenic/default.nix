{...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/apple-silicon-support
    ../common/system
    ../common/users
    ../common/environments/plasma.nix
    ../common/features/tailscale.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos/asahi.nix];

  networking.hostName = "arsenic-linux";

  boot.kernelParams = ["apple_dcp.show_notch=1"];

  system.stateVersion = "25.05"; # Did you read the comment?
}
