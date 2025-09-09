{ inputs, ... }: {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  # File
  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  # Keys
  sops.age.sshKeyPaths = [
    "/root/.ssh/id_ed25519"
    "/home/narlyx/.ssh/id_ed25519"
  ];

  # Entries
  sops.secrets.hello-world = { };
}
