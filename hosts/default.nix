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

	# Servers

	juuzuo = outputs.lib.nixosSystem {
		pkgs = mkPkgs "x86_64-linux";
		specialArgs = { inherit inputs outputs; };
		modules = [( import ./juuzuo )];
	};

	hisoka = outputs.lib.nixosSystem {
		pkgs = mkPkgs "x86_64-linux";
		specialArgs = { inherit inputs outputs; };
		modules = [( import ./hisoka )];
	};

	astrylx = outputs.lib.nixosSystem {
		pkgs = mkPkgs "x86_64-linux";
		specialArgs = { inherit inputs outputs; };
		modules = [( import ./astrylx )];
	};

	krylith = outputs.lib.nixosSystem {
		pkgs = mkPkgs "x86_64-linux";
		specialArgs = { inherit inputs outputs; };
		modules = [( import ./krylith )];
	};





}
			
