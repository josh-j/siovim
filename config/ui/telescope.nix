{pkgs, ...}: {
  plugins.telescope = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      defaults = {
        path_display = ["truncate"];
        sorting_strategy = "ascending";
        layout_config = {horizontal = {prompt_position = "top";};};
      };
      pickers = {
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
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Telescope Files";
      };
      "<leader>fg" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
      "<leader>fd" = {
        action = "fd";
        options.desc = "Telescope fd";
      };
      "<leader>fm" = {
        action = "marks";
        options.desc = "Telescope marks";
      };
      "<leader>fR" = {
        action = "registers";
        options.desc = "Telescope registers";
      };
      "<leader>fj" = {
        action = "jumplist";
        options.desc = "Telescope jumplist";
      };
      "<leader>sg" = {
        action = "live_grep";
        options.desc = "Telescope Live Grep";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Telescope search current buffer";
      };
      "<leader>th" = {
        action = "help_tags";
        options.desc = "Telescope find help";
      };
      "<leader>tm" = {
        action = "man_pages";
        options.desc = "Telescope Man Pages";
      };
      "<leader>tk" = {
        action = "keymaps";
        options.desc = "Telescope Keymaps";
      };
      "<leader>to" = {
        action = "vim_options";
        options.desc = "Telescope Vim options";
      };
      "<leader>tc" = {
        action = "commands";
        options.desc = "Telescope Commands";
      };
      "<leader>gC" = {
        action = "git_commits";
        options.desc = "Telescope git commits";
      };
    };
  };
}
