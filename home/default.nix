{ inputs, outputs, ... }: let
	mkPkgs = system:
		import outputs.nixpkgs {
			inherit system;
			overlays = outputs.overlays;
			config.allowUnfree = true;
		};
in {

	# Systems

	"narlyx@pharsyde" = outputs.lib.homeManagerConfiguration {
		pkgs = mkPkgs "x86_64-linux";
		extraSpecialArgs = { inherit inputs outputs; };
		modules = [ ./narlyx/pharsyde ];
	};

}
