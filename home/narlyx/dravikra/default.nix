{pkgs, ...}: {
  imports = [
    ../common/shared/base
    ../common/shared/apps/ghostty
    ../common/shared/apps/zsh
    ../common/shared/apps/zoxide
    ../common/shared/apps/starship
    ../common/shared/apps/tmux
    ../common/shared/apps/vim
    ../common/shared/apps/vscode
    ../common/shared/apps/git
    ../common/shared/lang/python
    ../common/shared/lang/node
    ../common/nixos/environments/i3
    ../common/shared/apps/librewolf
  ];
  
  home.packages = with pkgs; [
    spotify
    vesktop
    onlyoffice-desktopeditors
    vlc
    nextcloud-client
  ];
}
