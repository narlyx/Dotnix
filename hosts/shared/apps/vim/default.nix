{ pkgs, ... }: {

  programs.vim.enable = true;

  environment.systemPackages = [
    (pkgs.vim-full.customize {

      name = "vim";
      vimrcConfig = {

        customRC = ''
          " Indentation
          set autoindent
          set noexpandtab
          set tabstop=4
          set shiftwidth=4
          
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

