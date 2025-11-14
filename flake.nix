{
  description = "Newer new nix configuration";
  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Darwin for MacOS
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Packages for darwin via homebrew
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };

    # Autoindexing apps for darwin
    mac-app-util.url = "github:hraban/mac-app-util";

    # User configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // nix-darwin.lib // home-manager.lib;
  in {
    inherit nixpkgs lib;
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = import ./hosts {inherit inputs outputs;};
    darwinConfigurations = import ./hosts {inherit inputs outputs;};
    homeConfigurations = import ./home {inherit inputs outputs;};
  };
}
