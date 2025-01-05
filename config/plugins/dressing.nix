{pkgs, ...}: {
  plugins.dressing = {
    enable = pkgs.lib.mkDefault true;
  };
}
