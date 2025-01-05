{pkgs, ...}: {
  plugins.bacon = {
    enable = pkgs.lib.mkDefault true;
  };
}
