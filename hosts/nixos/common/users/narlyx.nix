{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  programs.zsh.enable = true;

  users.users.narlyx = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users."narlyx" = {
      home.username = "narlyx";
      home.homeDirectory = "/home/narlyx";
      imports = [../../../../home2/narlyx/nixos.nix ../../../../home/narlyx/nixos];
    };
  };
}
