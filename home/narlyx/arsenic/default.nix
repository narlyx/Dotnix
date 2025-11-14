{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.mac-app-util.homeManagerModules.default
    ../common/shared/base
    ../common/shared/apps/ghostty
    ../common/shared/apps/zsh
    ../common/shared/apps/zoxide
    ../common/shared/apps/starship
    ../common/shared/apps/tmux
    ../common/darwin/hushlogin
    ../common/shared/apps/vim
    ../common/shared/apps/git
    ../common/shared/apps/vscode
    ../common/shared/lang/python
    ../common/shared/lang/node
    ../common/shared/apps/syncthing
  ];
  home.packages = with pkgs; [
    brave
    brewCasks.proton-mail
    spotify
    vesktop
    brewCasks.krita
    brewCasks.onlyoffice
    brewCasks.android-studio
    brewCasks.roblox
    brewCasks.robloxstudio
    rojo
    brewCasks.prusaslicer
    (brewCasks.keyboardcleantool.overrideAttrs (oldAttrs: {
      src = pkgs.fetchurl {
        url = builtins.head oldAttrs.src.urls;
        hash = "sha256-nujha0SzBWI0KaODB91muIdL+nTtuFiwQ3rWKs3bdLY=";
      };
    }))
  ];
}
