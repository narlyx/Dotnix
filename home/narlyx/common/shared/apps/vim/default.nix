{pkgs, ...}: {
  programs.vim = {
    enable = true;
    settings = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      number = true;
      relativenumber = true;
    };
    extraConfig = ''
      if has('clipboard')
        set clipboard=unnamedplus
      endif
    '';
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
    ];
  };
}
