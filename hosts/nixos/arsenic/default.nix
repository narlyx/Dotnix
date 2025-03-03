{...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/apple-silicon-support
    ../common/system
    ../common/users
    ../common/features/tailscale.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos/asahi.nix];

  networking.hostName = "arsenic-linux";

  boot.kernelParams = ["apple_dcp.show_notch=1"];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
