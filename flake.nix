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

    # Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Homebrew
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };

    # Mac-app-util
    mac-app-util.url = "github:hraban/mac-app-util";

    # Neovim
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib // nix-darwin.lib;
  in {
    inherit nixpkgs lib;
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = import ./hosts/nixos {inherit inputs outputs;};
    darwinConfigurations = import ./hosts/darwin {inherit inputs outputs;};
    homeConfigurations = import ./home {inherit inputs outputs;};
  };
}
