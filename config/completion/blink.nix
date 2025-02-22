{
  plugins = {
    blink-cmp = {
      enable = true;
      luaConfig.post = ''
        require('blink.cmp').setup({
          cmdline = {
            sources = {}  -- Empty table to disable cmdline completion
          }
        })
      '';
      settings = {
        enabled.__raw = ''
          function()
            local win_conf = vim.api.nvim_win_get_config(0)
            local is_floating = win_conf.relative ~= nil
            return vim.bo.buftype ~= 'prompt' 
              and vim.bo.buftype ~= 'nofile'
              and not is_floating
              and vim.b.completion ~= false
          end
        '';
        keymap.preset = "enter";
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
        sources = {
          default = [ "lsp" "path" ];
        };
      };
    };
  };
}
