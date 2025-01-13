{ inputs, outputs, config, lib, pkgs, ... }:

{
  # Other modules
  imports = [
    ./hardware-configuration.nix
  ];

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Locale
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Zsh
  programs.zsh.enable = true;

  # Users
  users.users.narlyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  
  # Packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];

  # Services
  services.openssh.enable = true;
  
  # Networking
  networking.hostName = "lunathor";
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Version
  system.stateVersion = "24.11";
}

