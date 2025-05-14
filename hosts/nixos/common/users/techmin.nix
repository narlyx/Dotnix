{pkgs, ...}: {
  programs.zsh.enable = true;
  users.users.techmin = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
