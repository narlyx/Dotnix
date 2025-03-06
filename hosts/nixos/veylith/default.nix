{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
    ../common/features/ssh.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos/server.nix];

  # Host name
  networking.hostName = "veylith";

  # System version
  system.stateVersion = "24.11";
}
