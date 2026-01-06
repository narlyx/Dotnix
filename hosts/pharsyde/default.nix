{
	imports = [
		./hardware-configuration.nix
		../shared
		../shared/users/narlyx.nix
		../shared/environments/gnome
	];


	networking.hostName = "pharsyde";
}
