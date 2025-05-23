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
        bashls.enable = pkgs.lib.mkDefault true;
        cssls.enable = pkgs.lib.mkDefault true;
        dockerls.enable = pkgs.lib.mkDefault true;
        gopls.enable = pkgs.lib.mkDefault true;
        html.enable = pkgs.lib.mkDefault true;
        htmx.enable = pkgs.lib.mkDefault true;
        jsonls.enable = pkgs.lib.mkDefault true;
        lua_ls.enable = pkgs.lib.mkDefault true;
        marksman.enable = pkgs.lib.mkDefault true;
        
        # Configure nixd to NOT format (let conform handle it)
        nixd = {
          enable = pkgs.lib.mkDefault true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            formatting = {
              # Disable LSP formatting - conform will handle this
              command = null;
            };
            options = {
              nixos = {
                expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.HOSTNAME.options";
              };
            };
          };
        };
        
        pyright.enable = pkgs.lib.mkDefault true;
        solargraph.enable = pkgs.lib.mkDefault true;
        tailwindcss.enable = pkgs.lib.mkDefault true;
        taplo.enable = pkgs.lib.mkDefault true;
        tinymist.enable = pkgs.lib.mkDefault true;
        
        # Configure TypeScript server to not format
        ts_ls = {
          enable = pkgs.lib.mkDefault true;
          settings = {
            typescript = {
              format = {
                enable = false;  # Let conform/prettier handle formatting
              };
            };
            javascript = {
              format = {
                enable = false;  # Let conform/prettier handle formatting
              };
            };
          };
        };
        
        yamlls.enable = pkgs.lib.mkDefault true;
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
        
        -- Global LSP settings to prefer external formatters
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.formatting = false
        capabilities.textDocument.rangeFormatting = false
        
        -- Apply to all LSP servers
        require('lspconfig').util.default_config = vim.tbl_extend(
          'force',
          require('lspconfig').util.default_config,
          {
            capabilities = capabilities,
          }
        )
      '';
    };
  };
}
