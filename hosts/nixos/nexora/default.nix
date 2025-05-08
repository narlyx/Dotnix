{
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/desktops/plasma.nix
    ../common/services/printing.nix
    ../common/services/tailscale.nix
  ];

  environment.etc."modprobe.d/psmouse.conf".text = ''
    options psmouse synaptics_intertouch=1
  '';

  networking.hostName = "nexora";
  system.stateVersion = "25.05";
}
