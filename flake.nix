{
  description = "Configurations for Narlyx";

  # Inputs section
  inputs = {
    # Packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darwin (macos)
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Aylurs gtk shell
    ags.url = "github:aylur/ags";

    # Mac app utility
    mac-app-util.url = "github:hraban/mac-app-util";

    # Homebrew support
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };

    # Nvf (NeoVim)
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # End of inputs

  # Outputs section
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    brew-nix,
    mac-app-util,
    ...
  }: {
    # Nixos configurations
    nixosConfigurations = {
      "nexora" = nixpkgs.lib.nixosSystem {
        system = "x86_84-linux";
        specialArgs = { inherit inputs; };
        modules = [
          (import ./hosts/nixos/nexora)
        ];
      };
      "acetylene" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          (import ./hosts/nixos/acetylene)
        ];
      };
    };
    # End of nixos configurations

    # Darwin configurations
    darwinConfigurations = {
      "arsenic" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          (import ./hosts/macos/arsenic)
        ];
      };
    };
    # End of darwin configurations
  };
  # End of outputs
}
