{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/desktops/plasma.nix
    ../common/services/ssh.nix
    ../common/services/gpg.nix
    ../common/services/tailscale.nix
    ../common/services/printing.nix
  ];

  services.flatpak.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      amdvlk
      mesa.opencl
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];

  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
    ROC_ENABLE_PRE_VEGA = "1";
  };

  networking.hostName = "acetylene";
  system.stateVersion = "25.05";
}
