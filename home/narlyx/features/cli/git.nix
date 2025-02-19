{ pkgs, ... }:

{
  # Dependancies
  home.packages = with pkgs; [
    gh
  ];

  # Configuration
  programs.git = {
    enable = true;
    userName = "Narlyx";
    userEmail = "109835029+narlyx@users.noreply.github.com";
    extraConfig = {
      credential.helper = "gh auth git-credential";
      core.pager = "bat";
    };
  };
}
