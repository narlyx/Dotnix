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
          cheatsheet.enable = true;
          whichKey.enable = true;
        };

        keymaps = [
          {
            key = "<leader>n";
            mode = ["n"];
            action = ":Neotree<cr>";
            silent = true;
            desc = "Neo-tree";
          }
        ];

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = false;
        };

        ui = {
          borders.enable = false;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
        };

        notes.obsidian = {
          enable = false;
          setupOpts = {
            workspaces = [
              {
                name = "Docuents";
                path = "~/Documents";
              }
            ];
          };
        };
      };
    };
  };
}
