{
    description = "Gang... I need to stop.";

    inputs = {

        # Packages
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        # Home manager
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Hardware
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    };

    outputs = {
        self,
        nixpkgs,
        ...
    } @ inputs: let
        inherit (self) outputs;
        hosts = nixpkgs.lib.filter
            (name: (builtins.readDir ./hosts)."${name}" == "directory")
            (builtins.attrNames (builtins.readDir ./hosts));
        mkHost = name:
            nixpkgs.lib.nixosSystem {
                inherit (builtins.currentSystem);
                specialArgs = { inherit inputs outputs; };
                modules = [
                    ./hosts/${name}
                    ./modules
                    { networking.hostName = name; }
                ];
            };
    in {
        nixosConfigurations = nixpkgs.lib.genAttrs hosts mkHost;
    };
}

