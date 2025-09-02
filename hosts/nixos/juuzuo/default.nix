{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    
  ];

  environment.systemPackages = with pkgs; [ vim git ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "juuzuo";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXDO/fJLr/4xeoZyTzbDSOLkP3LOEvu/gSRmNRJg9wD'' ];
  system.stateVersion = "23.11";
}
