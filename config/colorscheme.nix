{pkgs, ...}: {
  colorschemes = {
    #   palette = {
    #     enable = pkgs.lib.mkDefault true;
    #     settings = {
    #     transparent_background = true;
    #       custom_palettes = {
    #         main = {
    #           color0 = "#191d33";
    #           color1 = "#1A1E39";
    #           color2 = "#383f5e";
    #           color3 = "#4e5470";
    #           color4 = "#7b7f94";
    #           color5 = "#a7a9b7";
    #           color6 = "#bdbfc9";
    #           color7 = "#d3d4db";
    #           color8 = "#e9e9ed";
    #         };
    #         accent = {
    #           accent0 = "#D97C8F";
    #           accent1 = "#D9AE7E";
    #           accent2 = "#D9D87E";
    #           accent3 = "#A5D9A7";
    #           accent4 = "#8BB9C8";
    #           accent5 = "#C9A1D3";
    #           accent6 = "#B8A1D9";
    #         };
    #         state = {
    #           error = "#D97C8F";
    #           warning = "#D9AE7E";
    #           hint = "#D9D87E";
    #           ok = "#A5D9A7";
    #           info = "#8BB9C8";
    #         };
    #       };
    #     };
    #   };

    cyberdream = {
      # enable = pkgs.lib.mkDefault true;
      enable = false;
      settings = {
        transparent = true;
        italic_comments = true;
        hide_fillchars = true;
        terminal_colors = false;

        extensions = {
          telescope = true;
          notify = true;
          mini = true;
          cmp = true;
          gitsigns = true;
          dashboard = true;
          indentblankline = true;
          noice = true;
          snacks = true;
          treesitter = true;
          treesittercontext = true;
          trouble = true;
          whichkey = true;
        };

        theme = {
          colors = {
            bg = "#1c1c1c";
            bgAlt = "#1c1c1c";
            bgHighlight = "#3c4048";
            fg = "#bdbfc9";
            grey = "#7b7f94";
            blue = "#8BB9C8";
            green = "#5faf5f";
            cyan = "#00afaf";
            red = "#af005f";
            yellow = "#ffaf00";
            magenta = "#af87d7";
            pink = "#ff5faf";
            orange = "#d7af5f";
            purple = "#B8A1D9";
          };
          variation = "dark";
          # saturation = 0.7;
        };
      };
    };

    oxocarbon = {
      enable = false;
    };

    gruvbox = {
      enable = false;
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
  };

  catppuccin = {
       enable = pkgs.lib.mkDefault true;
    settings = {
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      custom_highlights = ''
        function(highlights)
          return {
          CursorLineNr = { fg = highlights.peach, style = {} },
          NavicText = { fg = highlights.text },
          }
        end
      '';
      flavour = "macchiato"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      no_bold = false;
      no_italic = false;
      no_underline = false;
      transparent_background = true;
      integrations = {
        cmp = true;
        notify = true;
        gitsigns = true;
        neotree = true;
        which_key = true;
        illuminate = {
          enabled = true;
          lsp = true;
        };
        navic = {
          enabled = true;
          custom_bg = "NONE";
        };
        treesitter = true;
        telescope.enabled = true;
        indent_blankline.enabled = true;
        mini = {
          enabled = true;
          indentscope_color = "rosewater";
        };
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
}
