{pkgs, ...}: {
  plugins.nvim-tree = {
    enable = pkgs.lib.mkDefault true;
    updateFocusedFile.enable = pkgs.lib.mkDefault true;
  };
}
