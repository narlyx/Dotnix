{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/features/ssh.nix
    ../common/features/docker.nix
    ../common/features/mysqlserver.nix
  ];

  # Host name
  networking.hostName = "veylith";

  # System version
  system.stateVersion = "24.11";
}
