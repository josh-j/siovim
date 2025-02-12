{pkgs, stablePkgs, ...}: {
  extraConfigLuaPost = ''
    ${builtins.readFile ./extra.lua}
    -- PowerShell LSP configuration
    require('lspconfig').powershell_es.setup {
      bundle_path = '${pkgs.powershell-editor-services}/lib/PowerShellEditorServices',
      cmd = {
        '${pkgs.powershell}/bin/pwsh',
        '-NoLogo',
        '-Command',
        'Import-Module ${pkgs.powershell-editor-services}/PowerShellEditorServices/Start-EditorServices.ps1'
      },
      settings = {
        powershell = {
          codeFormatting = { Preset = "Custom" },
          scriptAnalysis = { enable = true }
        }
      }
    }
  '';

  extraPackages = with pkgs; [
    fd
    ripgrep
    # powershell  # Required core component
    powershell-editor-services
    nodejs  # Often required for LSP clients

    # PowerShell dependencies
    icu
    openssl
    zlib
  ] ++ [
    stablePkgs.lldb
  ] ++ lib.optionals stdenv.isDarwin [
    gnused
    darwin.libobjc
  ];
}
