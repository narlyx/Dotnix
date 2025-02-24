{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;

    userName = "Narlyx";
    userEmail = "109835029+narlyx@users.noreply.github.com";

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };
    };

    extraConfig = {
      credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
    };
  };
}
