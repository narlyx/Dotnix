{pkgs, ...}: {
  users.users.techmin = {
    isNormalUser = true;
    initialPassword = "changeme";
    shell = pkgs.bash;
    extraGroups = [
      "wheel"
    ];
  };
}
