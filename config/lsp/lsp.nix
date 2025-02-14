{
  pkgs,
  ...
}: {
  plugins = {
    lsp = {
      enable = pkgs.lib.mkDefault true;
      servers.typos_lsp.enable = pkgs.lib.mkDefault false;  # Good practice: disable unused servers

      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };

      servers = {
        powershell-editor-services = {
          enable = true;
          # Use the powershell-editor-services *from* the powershell package
          package = pkgs.powershell;

          settings = {
            powershell = {
              scriptAnalysis.enable = true;
            };

            # powerShellEditorServices settings:  MUCH SIMPLER!
            powerShellEditorServices = {
              # No need to specify bundledModulesPath, debugServicePath, etc.
              # It's all handled automatically when using the correct package.
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

        # Other LSP servers (good and concise list!)
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

    lint.enable = pkgs.lib.mkDefault true; // Assuming you have a lint plugin configured elsewhere
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
