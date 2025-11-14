{ inputs, outputs, ... }: let
  mkPkgs = system:
    import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = outputs.overlays;
    };
in {
  juuzuo = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./juuzuo)];
  };
  hisoka = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./hisoka)];
  };
  krylith = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./krylith)];
  };
  astrylx = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./astrylx)];
  };
  acetylene = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./acetylene)];
  };
  arsenic = outputs.lib.darwinSystem {
    pkgs = mkPkgs "aarch64-darwin";
    specialArgs = { inherit inputs outputs; };
    modules = [(import ./arsenic)];
  };
}
