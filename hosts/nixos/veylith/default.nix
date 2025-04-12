{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
    ../common/features/ssh.nix
    ../common/features/docker.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos/veylith.nix];

  # Host name
  networking.hostName = "veylith";

  # System version
  system.stateVersion = "24.11";
}
