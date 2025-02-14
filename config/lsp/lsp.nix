# lsp.nix
{ pkgs, lib, ... }:

let
  inherit (lib.nixvim) mkNullType; # For mkDefault and types.null
  inherit (lib) types;
in
{
  lsp = {
    enable = true;
    servers.typos_lsp.enable = false;

    keymaps.lspBuf = {
      "<c-k>" = "signature_help";
      "gi" = "implementation";
    };

    servers = {
      # PowerShell LSP Configuration
      powershell_es = {
        enable = true;
        package = pkgs.powershell;  # Correct package

        # Define options, mirroring the structure of your ccls example.
        options = {
          powerShellExePath = mkNullType types.str "${pkgs.powershell}/bin/pwsh"; # Default, but overridable

          settings = types.submodule {
            options = {
              powershell = types.submodule {
                options = {
                  scriptAnalysis = {
                    enable = mkNullType types.bool true; # Default to enabled
                  };
                };
              };
              powerShellEditorServices = types.submodule {
                options = {
                  powerShellExePath = mkNullType types.str "${pkgs.powershell}/bin/pwsh";
                  # Add other powerShellEditorServices settings here as needed,
                  # with appropriate types and defaults.  Examples:
                  # bundledModulesPath = mkNullType types.str "";
                  # debugServicePath = mkNullType types.str "";
                  # languageServicePath = mkNullType types.str "";
                  # ... more settings ...
                };
              };

              codeFormatting = types.submodule {
                options = {
                  enable = mkNullType types.bool true;
                  autoCorrectAliases = mkNullType types.bool true;
                  useCorrectCasing = mkNullType types.bool true;
                  whitespaceBeforeOpenBrace = mkNullType types.bool true;
                  whitespaceBeforeOpenParen = mkNullType types.bool true;
                  whitespaceAroundOperator = mkNullType types.bool true;
                  whitespaceAfterSeparator = mkNullType types.bool true;
                };
              };
            };
          };
        };

        # Use 'settings' to pass the options to the Lua configuration.
        settings = config.plugins.lsp.servers.powershell_es.options.settings; //CRUCIAL CHANGE
      };

      # Other LSP servers (as before, no changes needed here)
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
      # htmx.enable = true;  <-  Remove or comment out.  Handled in extraConfig if needed.
      solargraph.enable = true;
      yamlls.enable = true;
      taplo.enable = true;
    };

    # Use extraConfig for servers needing specific Lua setup (like htmx)
      extraConfig = ''
        local lspconfig = require('lspconfig')

        -- Example: HTMX configuration (ONLY if you use HTMX)
        lspconfig.htmx.setup {
          filetypes = { "html" },  -- Only activate for HTML files!
        }

        -- PowerShell Editor Services (using settings from Nix options)
        -- No need to repeat settings here, they are passed from Nix.

      '';
  };
}
