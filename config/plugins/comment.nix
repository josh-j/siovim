{pkgs, ...}: {
  plugins.comment = {
    enable = pkgs.lib.mkDefault true;
  };
}
