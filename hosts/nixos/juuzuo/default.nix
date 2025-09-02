{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ../common/features/tailscale.nix
  ];

  environment.systemPackages = with pkgs; [ vim git ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking = {
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "tailscale0" ];
      forwardPorts = [
        {
          destination = "100.123.57.96:25565";
          proto = "tcp";
          sourcePort = 25565;
        }
        {
          destination = "100.123.57.96:25565";
          proto = "udp";
          sourcePort = 25565;
        }
        {
          destination = "100.123.57.96:19132";
          proto = "tcp";
          sourcePort = 19132;
        }
        {
          destination = "100.123.57.96:19132";
          proto = "udp";
          sourcePort = 19132;
        }
        {
          destination = "100.123.57.96:24454";
          proto = "udp";
          sourcePort = 24454;
        }
      ];
    };
    nftables = {
      enable = true;
      ruleset = ''
        table ip nat {
          chain POSTROUTING {
            type nat hook postrouting priority srcnat; policy accept;
            masquerade;
          }
        }
      '';
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 25565 19132 ];
      allowedUDPPorts = [ 22 25565 19132 24454 ];
    };
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "juuzuo";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXDO/fJLr/4xeoZyTzbDSOLkP3LOEvu/gSRmNRJg9wD'' ];
  system.stateVersion = "25.05";
}
