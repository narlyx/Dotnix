{pkgs, ...}: {
  programs.bash.enable = true;
  users.users.techmin = {
    isNormaluser = true;
    initialPassword = "changeme";
    shell = pkgs.bash;
    extraGroups = [
      "wheel"
    ];
  };
}
