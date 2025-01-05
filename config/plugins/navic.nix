{pkgs, ...}: {
  plugins.navic = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      highlight = pkgs.lib.mkDefault true;
      lsp.autoAttach = pkgs.lib.mkDefault true;
    };
  };
}
