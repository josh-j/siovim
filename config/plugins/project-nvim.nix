{pkgs, ...}: {
  plugins.project-nvim = {
    enable = pkgs.lib.mkDefault true;
  };
}
