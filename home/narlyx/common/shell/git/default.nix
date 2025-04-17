{pkgs, ...}: {
  # Dependencies
  home.packages = with pkgs; [
    gh
  ];

  # Terminal interface
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          activeBorderColor = ["#8caaee"];
          inactiveBorderColor = ["#a5adce"];
          optionsTextColor = ["#8caaee"];
          selectedLineBgColor = ["#414559"];
          cherryPickedCommitBgColor = ["#51576d"];
          cherryPickedCommitFgColor = ["#8caaee"];
          unstagedChangesColor = ["#e78284"];
          defaultFgColor = ["#c6d0f5"];
          searchingActiveBorderColor = ["#e5c890"];
        };
      };
    };
  };

  # Git command
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
