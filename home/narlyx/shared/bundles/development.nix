{ pkgs, ... }: {
	imports = [
		../apps/vscode
	];
	home.packages = with pkgs; [
		android-studio
		jetbrains.idea
	];
}
