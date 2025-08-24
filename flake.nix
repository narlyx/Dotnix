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

    # Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Homebrew
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };

    # Mac-app-util
    mac-app-util.url = "github:hraban/mac-app-util";

    # Copyparty
    copyparty.url = "github:9001/copyparty";

    # Minecraft
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
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
    nixosConfigurations = import ./hosts/nixos {inherit inputs outputs;};
    darwinConfigurations = import ./hosts/darwin {inherit inputs outputs;};
    homeConfigurations = import ./home {inherit inputs outputs;};
  };
}
