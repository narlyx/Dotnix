{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos/server.nix];

  # Hostname
  networking.hostName = "veylith";

  services.openssh.enable = true;

  # System version
  system.stateVersion = "24.11";
}
