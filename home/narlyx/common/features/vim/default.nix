{pkgs, ...}: {
  programs.vim = {
    enable = true;
    settings = {
      tabstop = 2;
      expandtab = true;
      number = true;
      relativenumber = true;
    };
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
    ];
  };
}
