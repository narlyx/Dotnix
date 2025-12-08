{ pkgs, ... }: {
  # Modules
  imports = [
    ./hardware-configuration.nix

    ../common/nixos/base
    ../common/shared/packages.nix
    ../common/shared/fonts.nix
    ../common/nixos/system/grub-uefi.nix
    ../common/nixos/system/bluetooth.nix
    ../common/nixos/services/gpg.nix
    ../common/nixos/services/ssh.nix
    ../common/nixos/services/tailscale.nix
    ../common/nixos/services/printing.nix
    ../common/nixos/users/narlyx.nix
    ../common/nixos/environments/i3.nix
  ];

  # Trackpoint
  hardware.trackpoint = {
    enable = true;
    device = "TPPS/2 IBM TrackPoint";
    draghys = 255;
    drift_time = 5;
    emulateWheel = true;
    ext_dev = true;
    fakeButtons = false;
    inertia = 6;
    jenks = 135;
    mindrag = 20;
    press_to_select = true;
    reach = 10;
    sensitivity = 128;
    skipback = false;
    speed = 255; # Default is 97
    thresh = 8;
    upthresh = 255;
    ztime = 38;
  };

  # Hostname
  networking.hostName = "dravikra";
}
