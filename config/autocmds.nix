{
  autoCmd = [
    {
      event = ["BufWinEnter"];
      callback = {
        __raw = ''
          function()
              vim.cmd "set formatoptions-=cro"
          end
        '';
      };
    }
    {
      event = ["FileType"];
      pattern = [
        "markdown"
      ];
      callback = {
        __raw = ''
          function()
            vim.cmd ":TSDisable highlight"
          end
        '';
      };
    }

    # Close Telescope prompt in insert mode by clicking escape
    {
      event = ["FileType"];
      pattern = "TelescopePrompt";
      command = "inoremap <buffer><silent> <ESC> <ESC>:close!<CR>";
    }
    # Highlight yank text
    {
      event = "TextYankPost";
      pattern = "*";
      command = "lua vim.highlight.on_yank{timeout=500}";
    }

    # Close on 'q'
    {
      event = ["FileType"];
      pattern = [
        "netrw"
        "Jaq"
        "qf"
        "git"
        "help"
        "man"
        "lspinfo"
        "oil"
        "alpha"
        "snacks_dashboard"
        "snacks"
        "spectre_panel"
        "lir"
        "DressingSelect"
        ""
      ];
      callback = {
        __raw = ''
          function()
            vim.cmd [[
              nnoremap <silent> <buffer> q :close<CR>
              set nobuflisted
            ]]
          end
        '';
      };
    }
    {
      event = ["CmdWinEnter"];
      callback = {
        __raw = ''
          function()
              vim.cmd "quit"
            end
        '';
      };
    }
    {
      event = ["VimResized"];
      callback = {
        __raw = ''
          function()
              vim.cmd "tabdo wincmd ="
          end
        '';
      };
    }

    # Disable miniindent scope
    {
      event = ["FileType"];
      pattern = [
        "netrw"
        "Jaq"
        "qf"
        "git"
        "help"
        "man"
        "lspinfo"
        "Startup"
        "startup"
        "oil"
        "NvimTree_1"
        "NvimTree"
        "neo-tree"
        "NVIM"
        "spectre_panel"
        "lir"
        "SnacksDashboardOpened"
        "snacks_dashboard"
        "snacks"
        "DressingSelect"
        "neogitstatus"
        "alpha"
        "notify"
        "dashboard"
        "Trouble"
        "trouble"
        "toggleterm"
        ""
      ];
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }
  ];
}
