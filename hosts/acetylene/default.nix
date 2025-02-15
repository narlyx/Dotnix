{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/nixos
    ../common/nixos/grub.nix
    ../common/features/hyprland.nix
    ../common/features/virtualisation.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };

  networking.hostName = "acetylene";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    pciutils
  ];

  boot = {
    kernelParams = [ "kvm-amd" "amd_iommu=on" ];
    #blacklistedKernelModules = [ "amdgpu" ];
    kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
    postBootCommands = ''
      HOSTDEVS="0000:0b:00.0 0000:0b:00.1"
      VFIODEVS="0000:0e:00.0 0000:0e:00.1"

      for DEV in $HOSTDEVS; do
        echo "amdgpu" > /sys/bus/pci/devices/$DEV/driver_override
      done

      for DEV in $VFIODEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
      done
      modprobe -i vfio-pci
    '';
  };
  
  system.stateVersion = "24.11";
}
