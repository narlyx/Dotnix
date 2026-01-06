{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        bbenoist.nix
        ms-python.python
        ms-vscode-remote.remote-ssh
      ];
      userSettings = {
        "chat.commandCenter.enabled" = false;
        "chat.disableAIFeatures" = true;
        "editor.formatOnSave" = true;
        "editor.tabSize" = 4;
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "files.autoSave" = "onFocusChange";
        "git.autofetch" = true;
        "workbench.colorTheme" = "Catppuccin Frappé";
        "workbench.iconTheme" = "catppuccin-frappe";
        "workbench.startupEditor" = "none";
        "workbench.welcomePage.walkthroughs.openOnInstall" = false;
        "explorer.confirmDelete" = false;
      };
    };
  };
}
