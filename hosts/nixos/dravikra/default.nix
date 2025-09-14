{
  imports = [
    ./hardware-configuration.nix
    ../common/base
    ../common/features/bluetooth.nix
    ../common/features/printing.nix
    ../common/features/tailscale.nix
    ../common/users/narlyx.nix
    ../common/environments/xorg.nix
  ];

  # Touchpad fix
  environment.etc."modprobe.d/psmouse.conf".text = ''
    options psmouse synaptics_intertouch=1
  '';

  # Steam
  programs.steam.enable = true;

  networking.hostName = "dravikra";
}
