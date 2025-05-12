{
  inputs,
  outputs,
  ...
}: 
let
  mkPkgs = system: import outputs.nixpkgs {
    inherit system;
    overlays = outputs.overlays;
  };
in {
  "narlyx@acetylene" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/acetylene.nix];
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = {inherit inputs outputs;};
  };
  "narlyx@nexora" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/nexora.nix];
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = {inherit inputs outputs;};
  };
  "narlyx@arsenic" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/arsenic.nix];
    pkgs = mkPkgs "aarch64-darwin";
    extraSpecialArgs = {inherit inputs outputs;};
  };
}
