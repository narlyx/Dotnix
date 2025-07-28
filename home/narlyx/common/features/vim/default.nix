{pkgs, ...}: {
  programs.vim = {
    enable = true;
    settings = {
      tabstop = 2;
      expandtab = true;
      number = true;
      relativenumber = true;
    };
    extraConfig = ''
      set clipboard=unnamedplus
    '';
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
    ];
  };
}
