{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.brew-nix.darwinModules.default
    inputs.mac-app-util.darwinModules.default
  ];

  brew-nix.enable = true;

  users.users.narlyx = {
    home = "/Users/narlyx";
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  system.activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh narlyx'';

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [inputs.mac-app-util.homeManagerModules.default];
    users."narlyx" = {
      home.username = "narlyx";
      home.homeDirectory = "/Users/narlyx";
      programs.home-manager.enable = true;
      imports = [../../../../home/narlyx/macos];
    };
  };
}
