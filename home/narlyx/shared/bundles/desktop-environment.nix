{ pkgs, ... }: {
	imports = [
		./shell-environment.nix
		../apps/librewolf
		../apps/ghostty
		../apps/vscode
	];
	home.packages = with pkgs; [
		cider-2
		onlyoffice-desktopeditors
		krita
		audacity
	];
}
