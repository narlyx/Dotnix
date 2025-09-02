{
  inputs,
  outputs,
  ...
}: let
  mkPkgs = system:
    import outputs.nixpkgs {
      inherit system;
      overlays = outputs.overlays;
      config = {
        allowUnfree = true;
      };
    };
in {
  dravikra = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./dravikra)];
  };
  acetylene = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./acetylene)];
  };
  astrylx = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./astrylx)];
  };
  juuzuo = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./juuzuo)];
  };
}
