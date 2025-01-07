{pkgs, ...}: {
  extraPackages = with pkgs; [ripgrep];
  plugins.telescope = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      # defaults = {
      #   path_display = ["truncate"];
      #   sorting_strategy = "ascending";
      #   layout_config = {horizontal = {prompt_position = "top";};};
      # };

      defaults = {
        vimgrep_arguments = [
          "${pkgs.ripgrep}/bin/rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--fixed-strings"
        ];
        selection_caret = "  ";
        entry_prefix = "  ";
        prompt_prefix = "   ";
        # color_devicons = true;

        layout_strategy = "flex";
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
          "%.DS_Store"
        ];
        set_env.COLORTERM = "truecolor";
      };

      pickers = {
        colorscheme = {
          enable_preview = true;
        };
        find_files = {theme = "dropdown";};
        git_files = {theme = "dropdown";};
        fd = {theme = "dropdown";};
        buffers = {theme = "dropdown";};
        marks = {theme = "dropdown";};
        registers = {theme = "dropdown";};
        jumplist = {theme = "dropdown";};
        git_branches = {theme = "dropdown";};
        git_commits = {theme = "dropdown";};
        live_grep = {theme = "ivy";};
        current_buffer_fuzzy_find = {theme = "ivy";};
        help_tags = {theme = "dropdown";};
        man_pages = {theme = "ivy";};
        keymaps = {theme = "dropdown";};
        vim_options = {theme = "dropdown";};
        commands = {theme = "dropdown";};
      };
      mappings = {
        n = {
          "<C-j>" = {
            __raw = "require('telescope.actions').move_selection_next";
          };
          "<C-k>" = {
            __raw = "require('telescope.actions').move_selection_previous";
          };
          "<C-n>" = {
            __raw = "require('telescope.actions').cycle_history_next";
          };
          "<C-p>" = {
            __raw = "require('telescope.actions').cycle_history_prev";
          };
        };
        i = {
          "<C-j>" = {
            __raw = "require('telescope.actions').move_selection_next";
          };
          "<C-k>" = {
            __raw = "require('telescope.actions').move_selection_previous";
          };
        };
      };
    };
    extensions = {
      fzf-native = {
        enable = pkgs.lib.mkDefault true;
        settings.caseMode = "smart_case";
      };
      frecency = {
        enable = pkgs.lib.mkDefault true;
        settings = {
          showUnindexed = pkgs.lib.mkDefault true;
          defaultWorkspace = "CWD";
        };
      };
      undo = {
        enable = pkgs.lib.mkDefault true;
        settings.useDelta = pkgs.lib.mkDefault true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
    };
    keymaps = {
      "<leader><leader>" = {
        action = "git_files";
        options.desc = "Files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Search Text";
      };
      "<leader>fp" = {
        action = "projects";
        options.desc = "Search Todo";
      };
      "<leader>st" = {
        action = "todo-comments";
        options.desc = "Search Todo";
      };
      "<leader>sn" = {
        action = "notify";
        options.desc = "Search Notifications";
      };
      "<leader>su" = {
        action = "undo";
        options.desc = "Search Undo";
      };
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>fa" = {
        action = "frecency";
        options.desc = "Frecency";
      };
      "<leader>fd" = {
        action = "fd";
        options.desc = "Fd";
      };
      "<leader>ff" = {
        action = "find_files hidden=true";
        options.desc = "Find project files";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent";
      };
      "<c-p>" = {
        mode = [
          "n"
          "i"
        ];
        action = "registers";
        options.desc = "Select register to paste";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "commits";
      };
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>sc" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>sd" = {
        action = "diagnostics bufnr=0";
        options.desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help pages";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Key maps";
      };
      "<leader>sM" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Jump to Mark";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Options";
      };
      "<leader>uC" = {
        action = "colorscheme";
        options.desc = "Colorscheme preview";
      };

      "<leader>bb" = {
        action = "buffers";
        options.desc = "Buffers";
      };

      "<leader>bf" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Buffers";
      };
    };
  };
}
