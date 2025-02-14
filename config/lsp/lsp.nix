# lsp.nix
{ pkgs, ... }:

{
  enable = true;
  servers.typos_lsp.enable = false;

  keymaps.lspBuf = {
    "<c-k>" = "signature_help";
    "gi" = "implementation";
  };

  servers = {
    # PowerShell LSP Configuration (Manual)
    powershell_es = {
      enable = true;
      package = pkgs.powershell; # Correct package
      settings = {
        powerShellExePath = "${pkgs.powershell}/bin/pwsh"; # Path to pwsh
        # Other optional PowerShell settings can go here.
        # For example, you *could* add script analysis:
        # powershell = {
        #   scriptAnalysis.enable = true;
        # };
        # But it's not strictly required for basic functionality.
      };
    };

    # Other LSP servers (as before)
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
}
