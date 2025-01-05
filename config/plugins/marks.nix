{pkgs, ...}: {
  plugins.marks = {
    enable = pkgs.lib.mkDefault true;
  };
}
