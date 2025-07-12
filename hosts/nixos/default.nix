{
  inputs,
  outputs,
  ...
}: {
  dravikra = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./dravikra)];
  };
  acetylene = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs outputs;};
    modules = [(import ./acetylene)];
  };
}
