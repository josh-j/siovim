{ ... }:
{
  # Import all your configuration modules here

  imports = [
    ./ai
    ./completion
    ./debug
    ./keymaps
    ./lsp
    ./plugins
    ./treesitter
    ./ui
    ./autocmds.nix
    ./colorscheme.nix
    ./extra.nix
    ./options.nix
  ];
}
