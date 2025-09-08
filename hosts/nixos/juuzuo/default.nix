{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect

    # Manually importing everything because of a BIOS system
    ../common/base/extraPackages.nix
    ../common/base/input.nix
    ../common/base/locale.nix
    ../common/base/locale.nix
    ../common/base/networking.nix
    ../common/base/settings.nix
    ../common/users/root.nix

    # Features
    ../common/features/tailscale.nix
  ];

  # Port forwarding
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

  networking.hostName = "juuzuo";
}
