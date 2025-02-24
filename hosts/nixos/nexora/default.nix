{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/environments/hyprland.nix
    ../common/features/virtualisation.nix
    ../common/features/tailscale.nix
  ];

  # Hostname
  networking.hostName = "nexora";

  # Touchpad fix
  environment.etc."modprobe.d/psmouse.conf".text = ''
    options psmouse synaptics_intertouch=1
  '';

  # Other services
  services.fwupd.enable = true;

  # System version
  system.stateVersion = "24.11";
}
