{
  description = "The new nix config :sob:";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      "lunathor" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs; };
        modules = [ 
          ./hosts/lunathor
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.narlyx = import ./home/nixos.nix;
          }
        ];
      };
    };

  };
}
