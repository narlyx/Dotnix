{
  description = "Nix configuration version 2349052";

  inputs = {
    # Packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
