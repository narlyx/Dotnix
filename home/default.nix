{ inputs, outputs, ... }: let
  mkPkgs = system:
    import outputs.nixpkgs {
      inherit system;
      overlays = outputs.overlays;
      config.allowUnfree = true;
    };
in {
  "narlyx@acetylene" = outputs.lib.homeManagerConfiguration {
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = { inherit inputs outputs; };
    modules = [ ./narlyx/acetylene ];
  };
  "narlyx@dravikra" = outputs.lib.homeManagerConfiguration {
    pkgs = mkPkgs "x86_64-linux";
    extraSpecialArgs = { inherit inputs outputs; };
    modules = [ ./narlyx/dravikra ];
  };
  "narlyx@arsenic" = outputs.lib.homeManagerConfiguration {
    pkgs = mkPkgs "aarch64-darwin";
    extraSpecialArgs = { inherit inputs outputs; };
    modules = [ ./narlyx/arsenic ];
  };
}
