{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    imputs.brew-nix.darwinModules.default
    inputs.mac-app-util.darwinModules.default
  ];

  brew-nix.enable = true;

  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx'';

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [ mac-app-util.homeManagerModules.default ];
    users."narlyx" = {
      home.username = "narlyx";
      home.homeDirectory = "/Users/narlyx";
      imports = [ ../../../../home2/narlyx/darwin.nix ];
    };
  };
}
