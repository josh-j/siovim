{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        enabled.__raw = ''
          function()
            return vim.bo.buftype ~= "prompt"
              and vim.b.completion ~= false
              and not vim.tbl_contains({ "xlua", "markdown" }, vim.bo.filetype)
              -- and vim.api.nvim_win_get_config(0).relative ~= ""
           end
        '';
        keymap.preset = "enter";
        # fuzzy.implemenation = "lua";
        completion = {
          ghost_text.enabled = true;
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
          };
          accept = {
            auto_brackets = {
              blocked_filetypes = [ "ps1" ];
            };
          };
          list = {
            selection = {
              auto_insert = false;
              preselect = true;
            };
          };
          menu = {
            draw = {
              gap = 2;
              treesitter = [ "lsp" ];
              columns = [
                {
                  __unkeyed-1 = "label";
                  __unkeyed-2 = "label_description";
                  gap = 1;
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
              ];
              components = {
                label = {
                  width = {
                    fill = true;
                  };
                };
                kind_icon = {
                  width = {
                    fill = true;
                  };
                };
              };
            };
          };
        };

        cmdline = {
          enabled = false;
        };
        sources = {
          default = [ "lsp" "path" ];
          providers = {
            cmdline = {
              enabled = false;
            };
          };
        };
      };
    };
  };
}
