{
  pkgs,
  inputs,
  system,
  ...
}: {
  plugins = {
    cmp-emoji.enable = true;
    cmp-git.enable = true;
    cmp-spell.enable = true;
    cmp-calc.enable = true;
    cmp-treesitter.enable = true;
    # lsp.capabilities =
    #   # Lua
    #   ''
    #     capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())
    #   '';
    blink-cmp = {
      enable = true;
      # package = inputs.blink-cmp.packages.${system}.default;
      # luaConfig.pre =
      #   # lua
      #   ''
      #     require('blink.compat').setup({debug = true, impersonate_nvim_cmp = true})
      #   '';
      #
      settings = {
        keymap = {
          preset = "super-tab";
        };
        signature = {
          enabled = true;
        };

        # menu = {
        #   draw.treesitter = ["lsp"];
        #   # Do not auto show menu on cmdline or search
        #   auto_show.__raw = ''
        #     function(ctx)
        #       return ctx.mode ~= "cmdline"
        #     end
        #   '';
        # };

        sources = {
          default = [
            "buffer"
            "calc"
            # "copilot"
            "emoji"
            "git"
            "lsp"
            "luasnip"
            "path"
            "snippets"
            "spell"
            #"treesitter"
          ];
          providers = {
            emoji = {
              name = "emoji";
              module = "blink.compat.source";
            };
            # copilot = {
            #   name = "copilot";
            #   module = "blink-cmp-copilot";
            # };
            git = {
              name = "git";
              module = "blink.compat.source";
            };
            spell = {
              name = "spell";
              module = "blink.compat.source";
            };
            calc = {
              name = "calc";
              module = "blink.compat.source";
            };
          };
        };
        completion = {
          menu = {
            border = "none";
            draw = {
              gap = 1;
              treesitter = ["lsp"];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "label_description";
                  gap = 1;
                }
                {__unkeyed-2 = "kind_icon";}
                {__unkeyed-2 = "kind";}
              ];
            };
            # Hide in command
            auto_show.__raw = ''
              function(ctx)
                return ctx.mode ~= "cmdline"
              end
            '';
          };
          trigger = {
            show_in_snippet = false;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };
        };
      };
    };
  };
}
