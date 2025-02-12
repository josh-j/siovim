{
pkgs,
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
        powershell-editor-services = {
          enable = true;
          package = pkgs.nodePackages.powershell-editor-services;

          settings = {
            powershell = {
              scriptAnalysis.enable = true;

              powerShellEditorServices = {
                bundledModulesPath = "${pkgs.nodePackages.powershell-editor-services}/lib/node_modules/powershell-editor-services";
                debugServicePath = "${pkgs.nodePackages.powershell-editor-services}/lib/node_modules/powershell-editor-services/PowerShellEditorServices.dll";
                hostName = "PowerShellEditorServices";
                languageServicePath = "${pkgs.nodePackages.powershell-editor-services}/lib/node_modules/powershell-editor-services/PowerShellEditorServices.dll";
                powerShellExePath = "${pkgs.powershell}/bin/pwsh";
              };

              codeFormatting = {
                enable = true;
                autoCorrectAliases = true;
                useCorrectCasing = true;
                whitespaceBeforeOpenBrace = true;
                whitespaceBeforeOpenParen = true;
                whitespaceAroundOperator = true;
                whitespaceAfterSeparator = true;
              };
            };
          };
        };

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
