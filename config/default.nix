{lib, ...}: {
  # Import all your configuration modules here

  imports = [
    ./ai
    ./completion
    ./debug
    ./git
    ./keymaps
    ./lang
    ./lsp
    ./plugins
    ./treesitter
    ./ui
    ./autocmds.nix
    ./extra.nix
    ./options.nix

    # Load last
    #./themes
  ];
}
