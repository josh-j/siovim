{pkgs, ...}: {
  colorschemes = {
    palette = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        transparent_background = true;
        palettes = {
          main = "papermain";
          accent = "paperaccent";
          state = "paperstate";
        };
        custom_palettes = {
          main = {
            papermain = {
              color0 = "#993f33";
              color1 = "#2c2c2c"; # selected line
              color2 = "#2c2c2c"; #indentlines
              # color3 = "#404050"; #linenumbers, folders
              color3 = "#505060"; #linenumbers, folders
              # color4 = "#ff5faf"; #highlighted line number
              color4 = "#af87d7"; #highlighted line number
              color5 = "#868086"; #varnames
              color6 = "#9b9fb4"; #comments
              color7 = "#009090";
              color8 = "#606040"; # operators and strings
            };
          };
          accent = {
            paperaccent = {
              accent0 = "#D97C8F";
              accent1 = "#D9AE7E";
              accent2 = "#D9D87E";
              accent3 = "#A5D9A7";
              # accent4 = "#8BB9C8";
              accent4 = "#00afaf";
              accent5 = "#C9A1D3";
              accent6 = "#B8A1D9";
            };
          };
          state = {
            paperstate = {
              error = "#D97C8F";
              warning = "#D9AE7E";
              hint = "#D9D87E";
              ok = "#A5D9A7";
              info = "#8BB9C8";
            };
          };
        };
      };
    };
    #
    # cyberdream = {
    #   # enable = pkgs.lib.mkDefault true;
    #   enable = false;
    #   settings = {
    #     transparent = true;
    #     italic_comments = true;
    #     hide_fillchars = true;
    #     terminal_colors = false;
    #
    #     extensions = {
    #       telescope = true;
    #       notify = true;
    #       mini = true;
    #       cmp = true;
    #       gitsigns = true;
    #       dashboard = true;
    #       indentblankline = true;
    #       noice = true;
    #       snacks = true;
    #       treesitter = true;
    #       treesittercontext = true;
    #       trouble = true;
    #       whichkey = true;
    #     };
    #
    #     theme = {
    #       colors = {
    #         bg = "#1c1c1c";
    #         bgAlt = "#1c1c1c";
    #         bgHighlight = "#3c4048";
    #         fg = "#bdbfc9";
    #         grey = "#7b7f94";
    #         blue = "#8BB9C8";
    #         green = "#5faf5f";
    #         cyan = "#00afaf";
    #         red = "#af005f";
    #         yellow = "#ffaf00";
    #         magenta = "#af87d7";
    #         pink = "#ff5faf";
    #         orange = "#d7af5f";
    #         purple = "#B8A1D9";
    #       };
    #       variation = "dark";
    #       # saturation = 0.7;
    #     };
    #   };
    # };
    #
    oxocarbon = {
      enable = false;
    };

    gruvbox = {
      enable = false;
      settings = {
        transparent_mode = true;
        undercurl = true;
        underline = true;
        bold = true;
        italic = {
          strings = true;
          emphasis = true;
          comments = true;
          operators = false;
          folds = true;
        };
        strikethrough = true;
        invert_selection = false;
        invert_signs = false;
        invert_tabline = false;
        invert_intend_guides = false;
        inverse = true; #-- invert background for search, diffs, statuslines and errors
        contrast = "soft"; #-- can be "hard", "soft" or empty string
        dim_inactive = false;
      };
    };
  };
}
