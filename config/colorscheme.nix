{pkgs, ...}: {
  colorschemes = {
    oxocarbon = {
      enable = false;
    };

    gruvbox = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        transparent_mode = true;
        integrations = {
          cmp = true;
          flash = true;
          fidget = true;
          gitsigns = true;
          indent_blankline.enabled = true;
          lsp_trouble = true;
          mini.enabled = true;
          neotree = true;
          noice = true;
          notify = true;
          telescope.enabled = true;
          treesitter = true;
          treesitter_context = true;
          which_key = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              information = ["italic"];
              warnings = ["italic"];
              ok = ["italic"];
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
        };
      };
    };

    # tokyonight = {
    #   enable = pkgs.lib.mkDefault true;
    #   settings = {
    #     day_brightness = 0.3;
    #     dim_inactive = false;
    #     hide_inactive_statusline = false;
    #     light_style = "day";
    #     lualine_bold = false;
    #     on_colors = "function(colors) end";
    #     on_highlights = "function(highlights, colors) end";
    #     sidebars = [
    #       "qf"
    #       "vista_kind"
    #       "terminal"
    #       "packer"
    #     ];
    #     style = "storm";
    #     styles = {
    #       comments = {
    #         italic = true;
    #       };
    #       floats = "dark";
    #       functions = {};
    #       keywords = {
    #         italic = true;
    #       };
    #       sidebars = "dark";
    #       variables = {};
    #     };
    #     terminal_colors = true;
    #     transparent = true;
    #   };
    # };

    catppuccin = {
      enable = false;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        flavour = "macchiato"; # “latte”, “mocha”, “frappe”, “macchiato”, “auto”
        transparent_background = true;
        integrations = {
          cmp = true;
          flash = true;
          fidget = true;
          gitsigns = true;
          indent_blankline.enabled = true;
          lsp_trouble = true;
          mini.enabled = true;
          neotree = true;
          noice = true;
          notify = true;
          telescope.enabled = true;
          treesitter = true;
          treesitter_context = true;
          which_key = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              information = ["italic"];
              warnings = ["italic"];
              ok = ["italic"];
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
        };
      };
    };
  };
}
