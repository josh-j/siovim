{pkgs, ...}: {
  plugins = {
    luasnip = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        enable_autosnippets = pkgs.lib.mkDefault true;
      };
    };

    cmp = {
      enable = pkgs.lib.mkDefault true;
      autoEnableSources = pkgs.lib.mkDefault true;

      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        window = {
          documentation.border = "rounded";
          documentation.winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None";
          completion = {
            colOffset = -3;
            sidePadding = 0;
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None";
            border = "rounded";
          };
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
          {name = "git";}
          {name = "calc";}
        ];

        mapping = {
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
  };
}
