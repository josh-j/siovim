{
  config.keymaps = [
    # NvimTree
    # {
    #   action = "<cmd>NvimTreeFindFileToggle<CR>";
    #   key = "<leader>e";
    #   mode = "n";
    #   options = {
    #     noremap = true;
    #     silent = true;
    #     desc = "Explorer";
    #   };
    # }

    # NeoTree
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Explorer";
      };
    }

    # LSP
    {
      # Custom fn from extra_lua.nix which works like IntelliJ
      action = "<cmd>ToggleDefinition<cr>";
      key = "<leader>cD";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Go To Definition / Finder";
      };
    }
    {
      action = "<cmd>Lspsaga peek_definition<cr>";
      key = "<leader>cD";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Definition";
      };
    }
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "<leader>ch";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Hover doc";
      };
    }
    {
      action = "<cmd>Lspsaga finder<cr>";
      key = "<leader>cm";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Method finder";
      };
    }
    {
      action = "<cmd>Lspsaga incoming_calls<cr>";
      key = "<leader>ci";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Incoming calls";
      };
    }
    {
      action = "<cmd>Lspsaga outgoing_calls<cr>";
      key = "<leader>co";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Outgoing calls";
      };
    }
    # Alt+Enter for code actions like IntelliJ
    {
      action = "<cmd>Lspsaga code_action<cr>";
      key = "<M-CR>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Code Action";
      };
    }
    {
      action = "<cmd>Telescope diagnostics theme=dropdown<cr>";
      key = "<leader>xd";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Diagnostics";
      };
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      key = "]d";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Next Diagnostic";
      };
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      key = "[d";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Previous Diagnostic";
      };
    }
    {
      action = "<cmd>lua vim.lsp.codelens.run()<cr>";
      key = "<leader>l";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "CodeLens";
      };
    }
    {
      action = ":IncRename ";
      key = ",,";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Incremental Rename (file)";
      };
    }
    {
      action = "<cmd>Lspsaga lsp_rename ++project<cr>";
      key = "<leader>lR";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Project-wide Rename";
      };
    }

    # Terminal
    {
      action = "<cmd>Lspsaga term_toggle<CR>";
      key = "<C-\>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "ToggleTerm";
      };
    }
    {
      action = "<cmd>Lspsaga term_toggle<CR>";
      key = "<C-\>";
      mode = "t";
      options = {
        noremap = true;
        silent = true;
        desc = "ToggleTerm";
      };
    }

    # Folding
    {
      action = "<cmd>lua require('ufo').openAllFolds()<CR>";
      key = "zR";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Open All Folds";
      };
    }
    {
      action = "<cmd>lua require('ufo').closeAllFolds()<CR>";
      key = "zM";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Close All Folds";
      };
    }

    # Oil
    {
      # action = "<cmd>Oil --float<CR>";
      action = "<cmd>Oil<CR>";
      key = "-";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Oil";
      };
    }

    # Zen mode and twilight
    {
      action = "<cmd>ZenMode<CR>";
      key = "<leader>zz";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Zen Mode";
      };
    }
    {
      action = "<cmd>Twilight<CR>";
      key = "<leader>zt";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Twilight Mode";
      };
    }

    # TreeSJ
    {
      action = "<cmd>lua require('treesj').toggle()<CR>";
      key = "<leader>uj";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle treeSJ";
      };
    }
  ];
}
