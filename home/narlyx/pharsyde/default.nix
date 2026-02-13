{ pkgs, ... }: {
    imports = [
	../shared
	../shared/environments/gnome
	../shared/bundles/desktop.nix
	../shared/bundles/development.nix
	../shared/bundles/creative.nix
	../shared/services/flatpak
    ];
    home.packages = with pkgs; [
	prismlauncher
    ];
}
