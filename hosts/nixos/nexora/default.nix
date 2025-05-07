{
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/wms/plasma.nix
    ../common/services/printing.nix
    ../common/services/tailscale.nix
  ];

  environment.etc."modprobe.d/psmouseconf".text = ''
    options psmouse synaptics_intertouch=1
  '';

  networking.hostName = "nexora";
  system.stateVersion = "25.05";
}
