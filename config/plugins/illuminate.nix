{pkgs, ...}: {
  plugins.illuminate = {
    enable = pkgs.lib.mkDefault true;
    underCursor = pkgs.lib.mkDefault true;
  };
}
