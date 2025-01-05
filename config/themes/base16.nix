{
  lib,
  config,
  ...
}: {
  options = {
    base16.enable = lib.mkEnableOption "Enable base16 module";
  };
  config = lib.mkIf config.base16.enable {
    colorschemes = {
      base16 = {
        enable = true;
        colorscheme = "mountain";
        setUpBar = true;

        settings = {
          cmp = true;
          illuminate = true;
          indentblankline = true;
          lsp_semantic = true;
          mini_completion = true;
          telescope = true;
          telescope_borders = false;
        };
      };
    };
  };
}
