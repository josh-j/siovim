{lib, ...}: {
  # Import all your configuration modules here

  imports = [
    ./ai
    ./completion
    ./debug
    ./git
    ./keymaps
    ./lsp
    ./plugins
    ./themes
    ./treesitter
    ./ui
    ./autocmds.nix
    ./extra.nix
    ./options.nix
  ];
  colorschemes.enable = lib.mkDefault true;
}
