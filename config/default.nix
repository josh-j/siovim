{
  config,
  lib,
  ...
}: {
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
    # ./alpha.nix
    ./autocmds.nix
    ./bufferline.nix
    ./colorscheme.nix
    ./extra.nix
    ./lualine.nix
    ./options.nix
  ];
  options = {
    theme = lib.mkOption {
      default = lib.mkDefault "oxocarbon";
      type = lib.types.enum [
        "aquarium"
        "decay"
        "edge-dark"
        "everblush"
        "everforest"
        "far"
        "gruvbox"
        "jellybeans"
        "material"
        "material-darker"
        "mountain"
        "ocean"
        "oxocarbon"
        "paradise"
        "tokyonight"
        "yoru"
      ];
    };
    # assistant = lib.mkOption {
    #   default = "none";
    #   type = lib.types.enum [
    #     "copilot"
    #     "none"
    #   ];
    # };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "oxocarbon";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
