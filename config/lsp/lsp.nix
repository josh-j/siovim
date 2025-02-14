{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins = {
    lsp = {
      enable = pkgs.lib.mkDefault true;
      servers.typos_lsp.enable = pkgs.lib.mkDefault false;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
      servers = {
        # Other LSP servers remain the same...
        bashls.enable = pkgs.lib.mkDefault true;
        dockerls.enable = pkgs.lib.mkDefault true;
        gopls.enable = pkgs.lib.mkDefault true;
        jsonls.enable = pkgs.lib.mkDefault true;
        marksman.enable = pkgs.lib.mkDefault true;
        nil_ls.enable = pkgs.lib.mkDefault true;
        pyright.enable = pkgs.lib.mkDefault true;
        ts_ls.enable = pkgs.lib.mkDefault true;
        lua_ls.enable = pkgs.lib.mkDefault true;
        tailwindcss.enable = pkgs.lib.mkDefault true;
        tinymist.enable = pkgs.lib.mkDefault true;
        cssls.enable = pkgs.lib.mkDefault true;
        html.enable = pkgs.lib.mkDefault true;
        htmx.enable = pkgs.lib.mkDefault true;
        solargraph.enable = pkgs.lib.mkDefault true;
        yamlls.enable = pkgs.lib.mkDefault true;
        taplo.enable = pkgs.lib.mkDefault true;
      };

      # Add manual setup for PowerShell LSP with Linux paths
      postConfig = ''
        local lspconfig = require('lspconfig')
        local tempDir = vim.fn.expand('~/.cache/nvim/powershell_es')
        -- Create temp directory if it doesn't exist
        vim.fn.mkdir(tempDir, 'p')

        lspconfig.powershell_es.setup({
          bundle_path = "${pkgs.powershell-editor-services}/lib/powershell-editor-services",
          cmd = {
            "${pkgs.powershell}/bin/pwsh",
            "-NoLogo",
            "-NoProfile",
            "-ExecutionPolicy",
            "Bypass",
            "-Command",
            string.format(
              "&'${pkgs.powershell-editor-services}/lib/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1' -HostName 'nvim' -HostProfileId 'nvim' -HostVersion '1.0.0' -SessionDetailsPath '%s/session' -LogPath '%s/log' -LogLevel 'Diagnostic' -BundledModulesPath '${pkgs.powershell-editor-services}/lib/powershell-editor-services' -Stdio -EnableConsoleRepl",
              tempDir,
              tempDir
            )
          },
          filetypes = { "powershell", "ps1" },
          root_dir = function() return vim.loop.cwd() end,
          settings = {
            powershell = {
              scriptAnalysis = { enable = true },
            },
            powerShellEditorServices = {
              debugging = {
                createTemporaryIntegratedConsole = true,
              },
              bundledModules = {
                enable = true,
              }
            }
          }
        })
      '';
    };
    lint.enable = pkgs.lib.mkDefault true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
