{
  lib,
  config,
  ...
}: {
  options = {
    palette.enable = lib.mkEnableOption "Enable palette module";
  };
  config = lib.mkIf config.palette.enable {
    colorschemes = {
      palette = {
        enable = true;
        settings = {
          transparent_background = true;
          palettes = {
            main = "papermain";
            accent = "paperaccent";
            state = "paperstate";
          };
          custom_palettes = {
            main = {
              papermain = {
                color0 = "#993f33";
                color1 = "#2c2c2c"; # selected line
                color2 = "#2c2c2c"; #indentlines
                # color3 = "#404050"; #linenumbers, folders
                color3 = "#606070"; #linenumbers, folders
                # color4 = "#ff5faf"; #highlighted line number
                color4 = "#af87d7"; #highlighted line number
                # color5 = "#868086"; #varnames
                color5 = "#948e8b";
                color6 = "#44464f"; #comments
                color7 = "#009090";
                # color8 = "#606040"; # operators and strings
                color8 = "#707050"; # operators and strings
              };
            };
            accent = {
              paperaccent = {
                accent0 = "#D97C8F";
                accent1 = "#D9AE7E";
                accent2 = "#D9D87E";
                accent3 = "#A5D9A7";
                # accent4 = "#8BB9C8";
                accent4 = "#00afaf";
                accent5 = "#C9A1D3";
                accent6 = "#B8A1D9";
              };
            };
            state = {
              paperstate = {
                error = "#D97C8F";
                warning = "#D9AE7E";
                hint = "#D9D87E";
                ok = "#A5D9A7";
                info = "#8BB9C8";
              };
            };
          };
        };
      };
    };
  };
}
