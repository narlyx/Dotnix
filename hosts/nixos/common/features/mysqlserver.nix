{pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    configFile = pkgs.writeText "my.cnf" ''
      [mysqld]
      datadir=/var/lib/mysql
      port=3306
      bind-address = 0.0.0.0
    '';
  };
}
