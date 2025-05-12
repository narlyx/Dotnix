{inputs, ...}: {
  imports = [
    ../common/system
    ../common/users
    inputs.mac-app-util.darwinModules.default
  ];

  networking = {
    computerName = "arsenic";
    hostName = "arsenic";
  };

  system.stateVersion = 6;
}
