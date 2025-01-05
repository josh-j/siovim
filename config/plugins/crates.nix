{pkgs, ...}: {
  plugins.crates = {
    enable = pkgs.lib.mkDefault true;
  };
}
