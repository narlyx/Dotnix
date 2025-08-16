{pkgs, ...}: {
  users.users.www-data = {
    isSystemUser = true;
    shell = "/sbin/nologin";
    group = "www-data";
  };
  users.groups.www-data = {};
}
