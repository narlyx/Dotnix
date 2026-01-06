{ inputs, outputs, ... }: let
	mkPkgs = system:
		import inputs.nixpkgs {
			inherit system;
			config.allowUnfree = true;
			overlays = outputs.overlays;
		};
in {

	# Personal devices

	pharsyde = outputs.lib.nixosSystem {
		pkgs = mkPkgs "x86_64-linux";
		specialArgs = { inherit inputs outputs; };
		modules = [( import ./pharsyde )];
	};


}
			
