{ pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
    ./graphics.nix
		../shared
		../shared/users/narlyx.nix
		../shared/environments/gnome
	];

  programs.steam.enable = true;

	networking.hostName = "acetylene";
}
