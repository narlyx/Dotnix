{
  inputs,
  outputs,
  ...
}: let
  mkPkgs = system:
    import outputs.nixpkgs {
      inherit system;
      overlays = outputs.overlays;
    };
in {
  "narlyx@dravikra" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/dravikra];
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = {inherit inputs outputs;};
  };
  "narlyx@acetylene" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/acetylene];
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = {inherit inputs outputs;};
  };
}
