{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;

    # Global extensions
    extensions = with pkgs.vscode-extensions; [
      # QOL
      vscodevim.vim
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      # Look and feel
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      # Languages
      bbenoist.nix
    ];

    # Global user settings
    userSettings = {
      # Editor
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "files.autoSave" = "onFocusChange";
      # Updates
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
      # Color theme
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.iconTheme" = "catppuccin-mocha";
      # Other
      "chat.commandCenter.enabled" = false;
      "git.autofetch" = true;
    };
  };
}
