{pkgs, ...}: {
  plugins.lastplace = {
    enable = pkgs.lib.mkDefault true;
  };
}
