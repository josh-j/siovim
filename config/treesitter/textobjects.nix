{pkgs, ...}: {
  plugins.treesitter-textobjects = {
    enable = pkgs.lib.mkDefault true;
    select = {
      enable = pkgs.lib.mkDefault true;
      lookahead = pkgs.lib.mkDefault true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ac" = "@conditional.outer";
        "af" = "@function.outer";
        "ai" = "@conditional.outer";
        "al" = "@loop.outer";
        "ao" = "@class.outer";
        "at" = "@comment.outer";
        "ia" = "@parameter.inner";
        "ic" = "@conditional.inner";
        "if" = "@function.inner";
        "ii" = "@conditional.inner";
        "il" = "@loop.inner";
        "io" = "@class.inner";
      };
    };
    swap = {
      enable = pkgs.lib.mkDefault true;
      swapNext = {
        "<leader>pn" = {
          query = "@parameter.inner";
          desc = "Parameter swap next";
        };
      };
      swapPrevious = {
        "<leader>pp" = {
          query = "@parameter.inner";
          desc = "Parameter swap prev";
        };
      };
    };
    move = {
      enable = pkgs.lib.mkDefault true;
      setJumps = pkgs.lib.mkDefault true;
      gotoNextStart = {
        "]f" = {query = "@function.outer";};
        "]c" = {query = "@conditional.outer";};
        "]l" = {query = "@loop.outer";};
        "]o" = {query = "@class.outer";};
      };
      gotoNextEnd = {
        "]F" = {query = "@function.outer";};
        "]C" = {query = "@conditional.outer";};
        "]L" = {query = "@loop.outer";};
        "]O" = {query = "@class.outer";};
      };
      gotoPreviousStart = {
        "[f" = {query = "@function.outer";};
        "[c" = {query = "@conditional.outer";};
        "[l" = {query = "@loop.outer";};
        "[o" = {query = "@class.outer";};
      };
      gotoPreviousEnd = {
        "[F" = {query = "@function.outer";};
        "[C" = {query = "@conditional.outer";};
        "[L" = {query = "@loop.outer";};
        "[O" = {query = "@class.outer";};
      };
    };
  };
}
