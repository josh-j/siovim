{pkgs, ...}: {
  plugins = {
    nvim-autopairs = {
      enable = pkgs.lib.mkDefault true;
      settings.checkTs = pkgs.lib.mkDefault true;
    };
    crates.enable = pkgs.lib.mkDefault true;
    bacon.enable = pkgs.lib.mkDefault true;
    rustaceanvim.enable = pkgs.lib.mkDefault true;
    lastplace.enable = pkgs.lib.mkDefault true;
    todo-comments = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        mergeKeywords = pkgs.lib.mkDefault true;
        highlight = {
          before = "";
          after = "fg";
          keyword = "wide";
        };
        keywords = {
          QUESTION = {
            icon = "";
          };
        };
      };
    };
    comment.enable = pkgs.lib.mkDefault true;
    sleuth.enable = pkgs.lib.mkDefault true;
    nvim-tree = {
      enable = false;
      updateFocusedFile.enable = pkgs.lib.mkDefault true;
    };
    trim.enable = true;
    neoscroll.enable = true;
    dressing.enable = true;
    illuminate = {
      enable = pkgs.lib.mkDefault true;
      underCursor = pkgs.lib.mkDefault true;
    };
    navic = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        highlight = pkgs.lib.mkDefault true;
        lsp.autoAttach = pkgs.lib.mkDefault true;
      };
    };
    colorizer.enable = pkgs.lib.mkDefault true;
    marks.enable = pkgs.lib.mkDefault true;
    vim-matchup = {
      enable = pkgs.lib.mkDefault true;
      settings = pkgs.lib.mkDefault {
        surround_enabled = pkgs.lib.mkDefault 1;
        transmute_enabled = pkgs.lib.mkDefault 1;
      };
      treesitter = pkgs.lib.mkDefault {
        enable = pkgs.lib.mkDefault true;
      };
    };
    web-devicons.enable = true;
    persistence.enable = true;
    project-nvim.enable = true;
  };
}
