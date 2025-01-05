{pkgs, ...}: {
  plugins.trim = {
    enable = pkgs.lib.mkDefault true;
  };
}
