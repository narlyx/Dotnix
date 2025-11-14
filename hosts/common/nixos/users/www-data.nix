{pkgs, ...}: {
  users.groups.www-data = {
    gid = 33;
  };
  users.users.www-data = {
    isSystemUser = true;
    shell = "/sbin/nologin";
    group = "www-data";
    uid = 33;
  };
  users.groups.www-data = {};
}
