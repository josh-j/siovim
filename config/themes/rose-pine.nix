{ lib, config, ... }:
{
  options = {
    rose-pine.enable =  true;
  };
  config = lib.mkIf config.rose-pine.enable {
    colorschemes = {
      rose-pine = {
        enable = true;
        settings = {
          styles = {
            italic = true;
            bold = true;
            transparency = true;
          };
        };
      };
    };
  };
}
