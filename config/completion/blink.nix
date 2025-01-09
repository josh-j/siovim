{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "enter";
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 150;
          };
          list = {
            selection = {
              auto_insert = true;
              preselect = true;
            };
          };
          menu = {
            draw = {
              gap = 2;
              treesitter = [
                "lsp"
                # "copilot"
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
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          cmdline.__raw = "{}";
        };
        appearance = {
          kind_icons = {
            Copilot = "";
            Text = "󰉿";
            Method = "󰊕";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
          };
        };
      };
    };
  };
}
