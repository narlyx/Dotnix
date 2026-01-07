{ pkgs, ... }: {
	imports = [
		../shared
		../shared/bundles/desktop.nix
		../shared/bundles/development.nix
		../shared/bundles/creative.nix
	];
	home.packages = with pkgs; [
	];
}
