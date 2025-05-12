{inputs, ...}: {
  imports = [
    ../common/system
    ../common/users
    ../common/services/tailscale.nix
    inputs.mac-app-util.darwinModules.default
  ];

  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  system.stateVersion = 6;
}
