{ pkgs, ... }: {
    imports = [
        ./hardware-configuration.nix
        ./graphics.nix
        ../../modules/users/narlyx
        ../../modules/environments/gnome
        ../../modules/bootloaders/grub
    ];

    programs.steam.enable = true;
    home-manager.users.narlyx.home.packages = with pkgs; [
        prismlauncher
        krita
        gimp
        ardour
        inkscape
        prusa-slicer
    ];
}
