{ pkgs, ... }: {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdePackages.partitionmanager

    wayland-utils
    wl-clipboard
  ];
}
