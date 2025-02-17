{inputs, ...}: {
  imports = [inputs.nvf.homeManagerModules.default];

  # Using nvf to configure neovim
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        options = {
          autoindent = true;
          shiftwidth = 2;
          tabstop = 2;
          wrap = true;
        };

        spellcheck = {
          enable = true;
        };

        lsp = {
          formatOnSave = true;
          lightbulb.enable = true;
          lspSignature.enable = true;
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          bash.enable = true;
          clang.enable = true;
          html.enable = true;
          java.enable = true;
          ts.enable = true;
          go.enable = true;
          lua.enable = true;
          python.enable = true;
          nu.enable = true;
          markdown.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        visuals = {
          nvim-scrollbar.enable = true;
          indent-blankline.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "catppuccin";
          };
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = false;
        };

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = false;
        };

        dashboard.alpha.enable = true;

        utility = {
          diffview-nvim.enable = true;
        };

        ui = {
          borders.enable = false;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
        };
      };
    };
  };
}
