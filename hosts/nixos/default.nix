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
  # Desktops/laptops
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

  # Servers
  juuzuo = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./juuzuo)];
  };
  astrylx = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./astrylx)];
  };
  sylvester = outputs.lib.nixosSystem {
    pkgs = mkPkgs "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./sylvester)];
  };
}
