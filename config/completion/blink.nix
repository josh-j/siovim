{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "enter";
        completion = {
          ghost_text.enabled = true;
          #appearance = {
          #  highlight_ns = true;
          #};
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
              treesitter = [
                "lsp"
              ];
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
                "kind_icon" = {
                  width = {
                    fill = true;
                  };
                };
              };
            };
          };
        };
        #extraConfigLua = ''
        #local blink_cmp = require("blink-cmp")
        #blink-cmp.setup({
        #  cmdline = false
        #})
        #'';
        sources = {
          cmdline.__raw = ''
            function()
              local type = vim.fn.getcmdtype()
              if type == "/" or type == "?" then
                return { "buffer" }
              end
              if type == ":" or type == "@" then
                return { "cmdline", "path" }
              end
              return {}
            end
          '';          
        };
        # cmdline = {
        #   # don't intefer with telescope
        #   cmdline.__raw = "{}";
        # };
      };
    };
  };
}
