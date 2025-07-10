{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/desktops/plasma.nix
    ../common/services/ssh.nix
    ../common/features/gpg.nix
    ../common/services/tailscale.nix
    ../common/services/printing.nix
    ../common/features/virtualisation.nix
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

  environment.systemPackages = with pkgs; [
    pciutils
  ];

  boot = {
    kernelParams = ["kvm-amd" "amd_iommu=on"];
    kernelModules = ["vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio"];
    postBootCommands = ''
      HOSTDEVS="0000:0b:00.0 0000:0b:00.1"
      VFIODEVS="0000:0e:00.0 0000:0e:00.1"

      for DEV in $HOSTDEVS; do
        echo "amdgpu" > /sys/bus/pci/devices/$DEV/driver_override
      done
      modprobe -i vfio-pci
    '';
  };

  networking.hostName = "acetylene";
  system.stateVersion = "25.05";
}
