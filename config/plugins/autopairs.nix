{pkgs, ...}: {
  plugins.nvim-autopairs = {
    enable = pkgs.lib.mkDefault true;
    settings.checkTs = pkgs.lib.mkDefault true;
  };
}
