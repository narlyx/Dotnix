{ pkgs, ... }: {
	imports = [
	];
	home.packages = with pkgs; [
		krita
		gimp
		audacity
		inkscape
		blender
	];
}
