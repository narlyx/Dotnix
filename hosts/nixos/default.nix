{
  inputs,
  outputs,
  ...
}: {
  acetylene = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [
      (import ./acetylene)
    ];
  };
  nexora = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [
      (import ./nexora)
    ];
  };
}
