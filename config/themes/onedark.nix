{
  lib,
  config,
  ...
}: {
  options = {
    onedark.enable = lib.mkEnableOption "Enable onedark module";
  };
  config = lib.mkIf config.base16.enable {
    colorschemes = {
      onedark = {
        enable = true;
        settings = {
          colors = {yellow = "#d9a950";};
          style = "dark";
          transparent = true;
        };
      };
    };
  };
}
