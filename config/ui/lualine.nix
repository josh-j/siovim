{ icons, ... }:
let
  separators = {
    left = "";
    right = "";
  };
in
{
  plugins.lualine = {
    enable = true;
    settings.options = {
      theme =
        let
          transparent = {
            a = {
              fg = "none";
              bg = "none";
              gui = "bold";
            };
            b = {
              fg = "none";
              bg = "none";
            };
            c = {
              fg = "none";
              bg = "none";
            };
          };
        in
        {
          normal = transparent;
          insert = transparent;
          visual = transparent;
          replace = transparent;
          command = transparent;
          inactive = transparent;
        };
      always_divide_middle = true;
      globalstatus = true;
      icons_enable = true;
      component_separators = separators;
      section_separators = separators;
      disabled_filetypes = [ "Outline" "neo-tree" "dashboard" "snacks_dashboard" "snacks_terminal" ];
    };
  };
  extraConfigLua =
    # lua
    ''
      local components = {}
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end
    
      -- Remove the duplicate diff component definition
      components.diff = {
        "diff",
        source = diff_source,
        symbols = {
          added = "${icons.git.LineAdded}" .. " ",
          modified = "${icons.git.LineModified}" .. " ",
          removed = "${icons.git.LineRemoved}" .. " ",
        },
      }
    
      components.branch = {
        "b:gitsigns_head",
        icon = "${icons.git.Branch}",
        color = { gui = "bold" },
      }
    
      components.diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = "${icons.diagnostics.BoldError}" .. " ",
          warn = "${icons.diagnostics.BoldWarning}" .. " ",
          info = "${icons.diagnostics.BoldInformation}" .. " ",
          hint = "${icons.diagnostics.BoldHint}" .. " ",
        },
      }
    
      -- Add navic breadcrumbs component
      components.navic = {
        function()
          local navic = require("nvim-navic")
          if navic.is_available() then
            return navic.get_location()
          end
          return ""
        end,
        cond = function()
          local navic = require("nvim-navic")
          return navic.is_available()
        end,
        color = { fg = "#8783A3" },
      }
    
      components.indicator = function()
        local noice = require("noice")
        return {
          noice.api.statusline.mode.get,
          cond = noice.api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        }
      end
    
      components.filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
      components.fileformat = { "fileformat", cond = nil, padding = { left = 1, right = 1 }, color = "SLGreen" }
    
      components.lsp = {
        function()
          local clients = vim.lsp.get_clients()
          local lsp_names = {}
          if next(clients) == nil then
            return "Ls Inactive"
          end
          for _, client in ipairs(clients) do
            if client.name ~= "copilot" and client.name ~= "null-ls" and client.name ~= "typos_lsp" then
              local name = client.name:gsub("%[%d+%]", "")
              table.insert(lsp_names, name)
            end
          end
          local formatters = require("conform").list_formatters()
          local con_names = {}
          for _, formatter in ipairs(formatters) do
            local name = formatter.name
            if formatter.available and (name ~= "squeeze_blanks" and name ~= "trim_whitespace" and name ~= "trim_newlines") then
              table.insert(con_names, formatter.name)
            end
          end
          local names = {}
          vim.list_extend(names, lsp_names)
          vim.list_extend(names, con_names)
          return "[" .. table.concat(vim.fn.uniq(names), ", ") .. "]"
        end
      };
    
      local sections = {
        lualine_a = { components.mode },
        lualine_b = { components.fileformat, "encoding" },
        lualine_c = { 
          components.branch, 
          components.diff, 
          components.diagnostics,
          components.navic
        },
        lualine_x = {
          components.indicator(),
          components.lsp,
          components.filetype,
        },
        lualine_y = { "progress" },
      }
    
      local lualine = require("lualine")
      local config = lualine.get_config()
      config.sections = sections
      require("lualine").setup(config)
    '';
}
