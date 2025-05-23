{
  lib,
  config,
  ...
}: {
  options = {
    gruvbox.enable = lib.mkEnableOption "Enable gruvbox module";
  };
  config = lib.mkIf config.gruvbox.enable {
    colorschemes = {
      gruvbox = {
        enable = true;
        settings = {
          transparent_mode = true;
          undercurl = true;
          underline = true;
          bold = true;
          italic = {
            strings = true;
            emphasis = true;
            comments = true;
            operators = false;
            folds = true;
          };
          strikethrough = true;
          invert_selection = false;
          invert_signs = false;
          invert_tabline = false;
          invert_intend_guides = false;
          inverse = true; #-- invert background for search, diffs, statuslines and errors
          contrast = "soft"; #-- can be "hard", "soft" or empty string
          dim_inactive = false;
        };
      };
    };
  };
}
