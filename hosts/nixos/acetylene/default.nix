{pkgs, ...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/environments/hyprland.nix
    ../common/features/tailscale.nix
    ../common/features/virtualisation.nix
    ../common/features/flatpak.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos];

  # Host name
  networking.hostName = "acetylene";

  # Packages
  environment.systemPackages = with pkgs; [
    pciutils
  ];

  # GPU passthough
  boot = {
    kernelParams = ["kvm-amd" "amd_iommu=on"];
    kernelModules = ["vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio"];
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

  # System version
  system.stateVersion = "24.11";
}
