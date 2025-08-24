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
  arsenic = outputs.lib.darwinSystem {
    pkgs = mkPkgs "aarch64-darwin";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./arsenic)];
  };
}
