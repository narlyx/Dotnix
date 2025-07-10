{pkgs, ...}: {
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
      "render"
      "input"
    ];
    shell = pkgs.zsh;
  };
}
