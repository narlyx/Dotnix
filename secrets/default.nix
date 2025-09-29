{ inputs, config, ... }: {
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
  sops.secrets.share_password = {};
  sops.templates."share_credentials" = {
    content = ''
      username=www-data
      password=${config.sops.placeholder.share_password}
    '';
    #mode = "0400";
    #owner = "www-data";
    #group = "www-data";
  };
  sops.secrets.vaultwarden_token = {};
  sops.templates."vaultwarden_env" = {
    content = ''
      ADMIN_TOKEN=${config.sops.placeholder.vaultwarden_token}
    '';
  };
  sops.secrets.narlyx_password = {
    mode = "0400";
    owner = "www-data";
    group = "www-data";
  };
}
