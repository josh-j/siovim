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
        selection_caret = " ";
        entry_prefix = " ";
        prompt_prefix = " 󰍉  ";
        color_devicons = true;

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
  };
}
