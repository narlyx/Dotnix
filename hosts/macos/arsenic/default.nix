{
  # Imports section
  imports = [
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
    ../common/features/yabai.nix
  ];

  # Host name
  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  # System version
  system.stateVersion = 6;
}
