{
  pkgs,
  ...
}: {
  plugins = {
    lsp = {
      enable = true;  # Simplified: no need for pkgs.lib.mkDefault
      servers.typos_lsp.enable = false; # Simplified

      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };

      servers = {
        # Add PowerShell LSP
        powershell-editor-services = {
          enable = true;
          package = pkgs.powershell;  # Use the PowerShell package
          settings = {
            powershell = {
              scriptAnalysis.enable = true;
            };
            powerShellEditorServices = {
              powerShellExePath = "${pkgs.powershell}/bin/pwsh";
            };
            # Optional: Add more PowerShell-specific settings if desired
            # codeFormatting = { ... };
          };
        };

        # Existing LSP servers
        bashls.enable = true;
        dockerls.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        ts_ls.enable = true;
        lua_ls.enable = true;
        tailwindcss.enable = true;
        tinymist.enable = true;
        cssls.enable = true;
        html.enable = true;
        htmx.enable = true;
        solargraph.enable = true;
        yamlls.enable = true;
        taplo.enable = true;
      };
    };

    lint.enable = true; # Simplified
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
