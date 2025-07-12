{pkgs, ...}: {
  programs.zsh.enable = true;
  users.users.narlyx = {
    isNormalUser = true;
    initialPassword = "changeme";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "render"
      "networkmanager"
      "libvirtd"
      "docker"
    ];
  };
}
