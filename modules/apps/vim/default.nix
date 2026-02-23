{ pkgs, ... }: {

  programs.vim.enable = true;

  environment.systemPackages = [
    (pkgs.vim-full.customize {

      name = "vim";
      vimrcConfig = {

        customRC = ''
          " Indentation
          set autoindent
          set tabstop=4
          set shiftwidth=4
          set expandtab
          
          " Line numbers
          set number
          set relativenumber

          " Clipboard
          if has('clipboard')
            set clipboard=unnamedplus
          endif

		  " Syntax highligthing
		  syntax on
		  filetype on
        '';

        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            vim-tmux-navigator
          ];
        };

      };

    })
  ];
}

