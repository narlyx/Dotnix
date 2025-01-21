{
  # Description
  description = "The new nix config :sob:";

  # Inputs section
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

    # Mac app utility
    mac-app-util.url = "github:hraban/mac-app-util";

    # Homebrew packages
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
    url = "github:BatteredBunny/brew-api";
      flake = false;
    };
  };
  # End of inputs

  # Outputs section
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    brew-nix,
    mac-app-util,
    ...
    } @ inputs:
  let 
    inherit (self) outputs;
  in {
    # Modules
    #nixosModules = import ./modules/nixos;
    #darwinModules = import ./modules/darwin;
    #homeModules = import ./modules/home;

    # NixOS configurations
    nixosConfigurations = {

    };
    # End of NixOS configurations

    # Darwin configurations
    darwinConfigurations = {
      "arsenic" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs outputs nix-darwin; };
        modules = [
          ./hosts/arsenic
          brew-nix.darwinModules.default
          ( { ... }: { brew-nix.enable = true; })
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ mac-app-util.homeManagerModules.default ];
            home-manager.users.narlyx = import ./home/narlyx/darwin.nix;
          }
        ];
      };
    };
    # End of Darwin configurations
  };
  # End of outputs
}
