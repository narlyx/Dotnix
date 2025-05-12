{
  inputs,
  outputs,
  ...
}: {
  arsenic = outputs.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = {inherit inputs outputs;};
    modules = [
      (import ./arsenic)
    ];
  };
}
