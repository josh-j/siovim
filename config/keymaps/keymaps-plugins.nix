# keymaps-plugins.nix
{
  config.keymaps = [
    # --- Helix Space Mode Mimics (Direct Actions & 'w' Prefix) ---
    # Documentation: Referenced from your provided Helix Space mode list.

    # File Pickers & Navigation (Space f, F, b, j, g, ')
    {
      mode = "n";
      key = "<leader>f"; # Space f (File picker at LSP workspace root)
      action = "<cmd>Telescope frecency<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Find files at workspace root";
      };
    }
    {
      mode = "n";
      key = "<leader><leader>"; # Space f (File picker at LSP workspace root)
      action = "<cmd>Telescope fd<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Find files at workspace root";
      };
    }
    {
      mode = "n";
      key = "<leader>F"; # Space F (File picker at current working directory)
      # action.__raw = ''function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() }) end'';
      action = "<cmd>Telescope frecency workspace=CWD path_display={\"shorten\"}<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Find files in current directory";
      };
    }
    {
      mode = "n";
      key = "<leader>b"; # Space b (Buffer picker)
      action = "<cmd>Telescope buffers<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Buffer picker";
      };
    }
    {
      mode = "n";
      key = "<leader>j"; # Space j (Jumplist picker)
      action = "<cmd>Telescope jumplist<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Jumplist picker";
      };
    }
    {
      mode = "n";
      key = "<leader>g"; # Space g (Changed file picker)
      action = "<cmd>Telescope git_status<CR>"; # Shows changed/staged files
      options = {
        noremap = true;
        silent = true;
        desc = "Changed file picker";
      };
    }
    {
      mode = "n";
      key = "<leader>'"; # Space ' (Last fuzzy picker)
      action = "<cmd>Telescope resume<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Last fuzzy picker";
      };
    }

    # LSP & Code Intelligence (Space k, s, S, d, D, r, a, h)
    {
      mode = "n";
      key = "<leader>k"; # Space k (Hover documentation)
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Hover documentation";
      };
    }
    {
      mode = "n";
      key = "<leader>s"; # Space s (Document symbol picker)
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Document symbol picker";
      };
    }
    {
      mode = "n";
      key = "<leader>S"; # Space S (Workspace symbol picker)
      action = "<cmd>Telescope lsp_workspace_symbols<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Workspace symbol picker";
      };
    }
    {
      mode = "n";
      key = "<leader>d"; # Space d (Document diagnostics picker)
      action.__raw = ''function() require("telescope.builtin").diagnostics({ bufnr = vim.api.nvim_get_current_buf() }) end'';
      options = {
        noremap = true;
        silent = true;
        desc = "Document diagnostics picker";
      };
    }
    {
      mode = "n";
      key = "<leader>D"; # Space D (Workspace diagnostics picker)
      action = "<cmd>Telescope diagnostics<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Workspace diagnostics picker";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>a"; # Space a (Apply code action)
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Code Actions (Space a)";
      };
    }
    {
      mode = "n";
      key = "<leader>r"; # Space r (Rename symbol)
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Rename Symbol";
      };
    }
    {
      mode = "n";
      key = "<leader>h"; # Space h (Select symbol references)
      action = "<cmd>Telescope lsp_references<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Symbol References";
      };
    }

    # Window Management (Space w - this IS a prefix)
    {
      mode = "n";
      key = "<leader>w"; # Space w (Enter window mode)
      action = "<Nop>"; # Prefix for window commands, use with which-key.nvim
      options = {
        noremap = true;
        silent = true;
        desc = "Window Mode Prefix";
      };
    }
    # Helix Window Mode Examples (use these or adapt to your preferred window commands)
    {
      mode = "n";
      key = "<leader>wv";
      action = "<C-w>v";
      options = {
        noremap = true;
        silent = true;
        desc = "Split Vertical";
      };
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<C-w>s";
      options = {
        noremap = true;
        silent = true;
        desc = "Split Horizontal";
      };
    }
    {
      mode = "n";
      key = "<leader>wq";
      action = "<C-w>c";
      options = {
        noremap = true;
        silent = true;
        desc = "Close Window";
      };
    } # Helix 'q' is often close
    {
      mode = "n";
      key = "<leader>wo";
      action = "<C-w>o";
      options = {
        noremap = true;
        silent = true;
        desc = "Only Window";
      };
    }
    # Add other Helix window commands like (wx, wh, wl, wj, wk for focus, etc.) if desired

    # Search, Command Palette & Debug (Space /, ?, G)
    {
      mode = "n";
      key = "<leader>/"; # Space / (Global search)
      action = "<cmd>Telescope live_grep<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Global Search";
      };
    }
    {
      mode = "n";
      key = "<leader>?"; # Space ? (Command palette)
      action = "<cmd>Telescope commands<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Command Palette";
      };
    }
    {
      mode = "n";
      key = "<leader>G"; # Space G (Debug)
      action.__raw = ''function() require("dapui").toggle() end''; # Toggles general DAP UI
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle DAP UI";
      };
    }

    # --- Neovim Specific Functionality & Relocated Mappings (under <leader>x prefix) ---

    # File Explorer (NeoTree)
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle NeoTree Explorer";
      };
    }

    # File Navigation (Oil) - This was not under <leader> so it's fine as is
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Open parent directory (Oil)";
      };
    }

    # General LSP (Not directly in Helix Space mode, but useful standard Vim keys - keeping these as is)
    {
      mode = "n";
      key = "K";
      action.__raw = ''function() if not require("ufo").peekFoldedLinesUnderCursor() then vim.cmd("Lspsaga hover_doc") end end'';
      options = {
        noremap = true;
        silent = true;
        desc = "Hover Doc / UFO Peek Fold";
      };
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>Lspsaga goto_definition<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Go To Definition";
      };
    }
    {
      mode = "n";
      key = "gpd";
      action = "<cmd>Lspsaga peek_definition<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Peek Definition";
      };
    }
    {
      mode = "n";
      key = "gt";
      action = "<cmd>Lspsaga goto_type_definition<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Go To Type Definition";
      };
    }
    {
      mode = "n";
      key = "gpt";
      action = "<cmd>Lspsaga peek_type_definition<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Peek Type Definition";
      };
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Next Diagnostic";
      };
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Previous Diagnostic";
      };
    }

    # LSP Extras (moved to <leader>xl prefix)
    {
      mode = "n";
      key = "<leader>xl";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Extras Prefix";
      };
    }
    {
      mode = "n";
      key = "<leader>xli";
      action = "<cmd>LspInfo<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Info";
      };
    }
    {
      mode = "n";
      key = "<leader>xlc";
      action.__raw = ''function() vim.lsp.codelens.run() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "LSP CodeLens Run";
      };
    }
    {
      mode = "n";
      key = "<leader>xlm";
      action = "<cmd>Lspsaga finder<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Finder (Refs/Impls)";
      };
    }
    {
      mode = "n";
      key = "<leader>xlo";
      action = "<cmd>Lspsaga outline<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Document Outline";
      };
    }
    {
      mode = "n";
      key = "<leader>xlI";
      action = "<cmd>Lspsaga incoming_calls<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Incoming Calls";
      };
    }
    {
      mode = "n";
      key = "<leader>xlO";
      action = "<cmd>Lspsaga outgoing_calls<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "LSP Outgoing Calls";
      };
    }
    {
      mode = "n";
      key = "<leader>xlf";
      action.__raw = ''function() require("conform").format() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "Format code (Conform)";
      };
    } # Formatting moved here
    {
      mode = "n";
      key = "<leader>xlt";
      action = "<cmd>Lspsaga term_toggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Terminal";
      };
    } # Terminal moved here
    {
      mode = "n";
      key = "<leader>\\";
      action = "<cmd>Lspsaga term_toggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Terminal";
      };
    } # Terminal moved here

    # Incremental Rename (filename) - keeping , as it's distinct
    {
      mode = "n";
      key = ",,";
      action = ":IncRename ";
      options = {
        noremap = true;
        silent = false;
        desc = "Incremental Rename (filename)";
      };
    }

    # Folding (UFO) - standard zR, zM are fine
    {
      mode = "n";
      key = "zR";
      action.__raw = ''function() require("ufo").openAllFolds() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "UFO: Open All Folds";
      };
    }
    {
      mode = "n";
      key = "zM";
      action.__raw = ''function() require("ufo").closeAllFolds() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "UFO: Close All Folds";
      };
    }

    # UndoTree (moved to <leader>xu)
    {
      mode = "n";
      key = "<leader>xuu";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Undotree";
      };
    }

    # Editing Enhancements (moved to <leader>xu or <leader>xz)
    {
      mode = "n";
      key = "<leader>xuj";
      action.__raw = ''function() require("treesj").toggle() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle TreeSJ (split/join)";
      };
    }
    {
      mode = "n";
      key = "<leader>xzz";
      action = "<cmd>ZenMode<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Zen Mode";
      };
    }
    {
      mode = "n";
      key = "<leader>xzt";
      action = "<cmd>Twilight<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Twilight Mode";
      };
    }

    # Git & Gitsigns (moved to <leader>xg prefix for non-Helix equivalents)
    # Standard hunk navigation ]h, [h are fine as is
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns next_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Next Hunk";
      };
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns prev_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Previous Hunk";
      };
    }

    {
      mode = "n";
      key = "<leader>xg";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Extras Prefix";
      };
    }
    {
      mode = "n";
      key = "<leader>xgp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Preview Hunk";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>xgs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Stage Hunk";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>xgr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Reset Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>xgS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Stage Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>xgR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Reset Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>xgu";
      action = "<cmd>Gitsigns undo_stage_hunk<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Undo Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>xgb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Blame Line";
      };
    }
    {
      mode = "n";
      key = "<leader>xgd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Gitsigns Diff This";
      };
    }
    # Fugitive / General Git Commands
    {
      mode = "n";
      key = "<leader>xG";
      action = "<cmd>G<CR>";
      options = {
        noremap = true;
        silent = false;
        desc = "Git Status (Fugitive)";
      };
    } # Old <leader>gs moved to <leader>xG (like Git)
    {
      mode = "n";
      key = "<leader>xgdt";
      action = "<cmd>diffget //3<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Diffget Theirs (merge)";
      };
    }
    {
      mode = "n";
      key = "<leader>xgdo";
      action = "<cmd>diffget //2<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Diffget Ours (merge)";
      };
    }
    {
      mode = "n";
      key = "<leader>xgf";
      action = "<cmd>Telescope git_files<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Git Files";
      };
    } # old <leader>gft
    {
      mode = "n";
      key = "<leader>xgc";
      action = "<cmd>Telescope git_commits<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Git Commits";
      };
    } # old <leader>gc

    # Debugging (DAP - moved to <leader>xd prefix, as <leader>G is main toggle)
    {
      mode = "n";
      key = "<leader>xd";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Commands Prefix";
      };
    }
    {
      mode = "n";
      key = "<leader>xdc";
      action = "<cmd>DapContinue<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>xdO";
      action = "<cmd>DapStepOver<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>xdi";
      action = "<cmd>DapStepInto<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Step Into";
      };
    }
    {
      mode = "n";
      key = "<leader>xdo";
      action = "<cmd>DapStepOut<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>xdp";
      action.__raw = ''function() require("dap").pause() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>xdb";
      action = "<cmd>DapToggleBreakpoint<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>xdB";
      action.__raw = ''function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end'';
      options = {
        noremap = true;
        silent = false;
        desc = "DAP Set Conditional Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>xdr";
      action.__raw = ''function() require("dap").run_last() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>xds";
      action.__raw = ''function() require("dap").session() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Session Info";
      };
    }
    {
      mode = "n";
      key = "<leader>xdt";
      action = "<cmd>DapTerminate<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>xdw";
      action.__raw = ''function() require("dap.ui.widgets").hover() end'';
      options = {
        noremap = true;
        silent = true;
        desc = "DAP UI Widgets Hover";
      };
    }
    {
      mode = "n";
      key = "<leader>xde";
      action.__raw = ''function() require("dapui").eval() end'';
      options = {
        noremap = true;
        silent = false;
        desc = "DAP UI Eval Expression";
      };
    }
    {
      mode = "n";
      key = "<leader>xdR";
      action = "<cmd>DapToggleRepl<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "DAP Toggle REPL";
      };
    }

    # Special Delete to Void Register (moved to <leader>xx)
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>xxd";
      action = "\"_d";
      options = {
        noremap = true;
        silent = true;
        desc = "Delete to void register";
      };
    }

    # --- Telescope Pickers (Relocated & Neovim Specific - under <leader>xf or <leader>xs prefixes) ---
    {
      mode = "n";
      key = "<leader>xfH";
      action = "<cmd>Telescope find_files hidden=true<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Find Files (Hidden)";
      };
    } # Extends <leader>f
    {
      mode = "n";
      key = "<leader>xfo";
      action = "<cmd>Telescope oldfiles<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Old/Recent Files";
      };
    }
    {
      mode = "n";
      key = "<leader>xop";
      action = "<cmd>Telescope projects<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Open Projects";
      };
    } # 'o' for open?
    {
      mode = "n";
      key = "<leader>xof";
      action = "<cmd>Telescope frecency<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Open Frecency";
      };
    }
    {
      mode = "n";
      key = "<leader>xfd";
      action = "<cmd>Telescope fd<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Open Find with FD";
      };
    } # 'f' for find
    {
      mode = "n";
      key = "<leader>xfb";
      action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Fuzzy Find in Current Buffer";
      };
    } # 'f' for find

    # Telescope 'search' group (moved to <leader>xs prefix, as <leader>s is doc symbols)
    {
      mode = "n";
      key = "<leader>xs";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Search Prefix";
      };
    }
    {
      mode = "n";
      key = "<leader>xsm";
      action = "<cmd>Telescope marks<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Marks";
      };
    }
    {
      mode = "n";
      key = "<leader>xsh";
      action = "<cmd>Telescope help_tags<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Help Tags";
      };
    }
    {
      mode = "n";
      key = "<leader>xsk";
      action = "<cmd>Telescope keymaps<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>xs:";
      action = "<cmd>Telescope command_history<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Command History";
      };
    } # old <leader>:
    {
      mode = "n";
      key = "<leader>xso";
      action = "<cmd>Telescope vim_options<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Vim Options";
      };
    }
    {
      mode = "n";
      key = "<leader>xsa";
      action = "<cmd>Telescope autocommands<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Autocommands";
      };
    }
    {
      mode = "n";
      key = "<leader>xsM";
      action = "<cmd>Telescope man_pages<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Man Pages";
      };
    }
    {
      mode = "n";
      key = "<leader>xst";
      action = "<cmd>Telescope todo-comments<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Todo Comments";
      };
    }
    {
      mode = "n";
      key = "<leader>xsn";
      action = "<cmd>Telescope notify<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Notifications";
      };
    }

    # Other Telescope Pickers (relocated or checked for conflicts)
    # <c-p> for registers is not a <leader> mapping, so it's fine as is.
    {
      mode = [
        "n"
        "i"
      ];
      key = "<c-p>";
      action = "<cmd>Telescope registers<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Registers";
      };
    }
    {
      mode = "n";
      key = "<leader>xuC";
      action = "<cmd>Telescope colorscheme enable_preview=true<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Telescope Colorscheme Preview";
      };
    } # 'u' for UI/Utility?

    # Terminal toggle from terminal mode - fine as is
    {
      mode = "t";
      key = "<C-\\>";
      action = "<cmd>Lspsaga term_toggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Terminal (from Terminal mode)";
      };
    }
  ];
}
