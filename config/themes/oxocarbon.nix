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
        settings = {
          luaConfig.post = ''
            vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#232323" })
          '';
        };
      };
    };
  };
}
