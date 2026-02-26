{ pkgs, ... }: {
    # Docker
    virtualisation.docker.enable = true;

    # Distrobox
    environment.systemPackages = [ pkgs.distrobox ];
}
