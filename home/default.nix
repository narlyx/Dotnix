{
  inputs,
  outputs,
  ...
}: {
  "narlyx@acetylene" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/acetylene.nix];
    pkgs = import outputs.nixpkgs {
      system = "x86_64-linux";
    };
    extraSpecialArgs = {inherit inputs outputs;};
  };
  "narlyx@nexora" = outputs.lib.homeManagerConfiguration {
    modules = [./narlyx/nexora.nix];
    pkgs = import outputs.nixpkgs {
      system = "x86_64-linux";
    };
    extraSpecialArgs = {inherit inputs outputs;};
  };
}
