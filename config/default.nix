{...}: {
  # Import all your configuration modules here

  imports = [
    ./ai
    ./completion
    ./keymaps
    ./lsp
    ./mini
    ./plugins
    ./snacks
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
