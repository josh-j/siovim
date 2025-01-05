{
  lib,
  config,
  ...
}: {
  options = {
    oxocarbon.enable = lib.mkEnableOption "Enable oxocarbon module";
  };
  config = lib.mkIf config.oxocarbon.enable {
    colorschemes = {
      oxocarbon = {
        enable = true;
      };
    };
  };
}
