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
    ./bufferline.nix
    ./colorscheme.nix
    ./extra.nix
    ./lualine.nix
    ./options.nix
  ];
}
