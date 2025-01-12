{
  # Flake description
  description = "The new nix config :sob:";

  # Inputs
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Outputs
  outputs = { self, nixpkgs, home-manager, nix-darwin, ... } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configurations
    nixosConfigurations = {
      "lunathor" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
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

    # Darwin configurations
    darwinConfigurations = {
      "arsenic" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs outputs nix-darwin; };
        modules = [
          ./hosts/arsenic
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.narlyx = import ./home/darwin.nix;
          }
        ];
      };
    };
  };
}
