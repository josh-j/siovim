{...}: {
  # Import all your configuration modules here

  imports = [
    ./ai
    ./completion
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
