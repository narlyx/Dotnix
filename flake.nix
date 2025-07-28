{
  description = "Nix configuration 2000 :confounded:";
  inputs = {
    # Package repository
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Copyparty
    copyparty.url = "github:9001/copyparty";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
  in {
    inherit nixpkgs lib;
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = import ./hosts/nixos {inherit inputs outputs;};
    homeConfigurations = import ./home {inherit inputs outputs;};
  };
}
