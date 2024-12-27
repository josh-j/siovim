{pkgs, ...}: {
  colorschemes.obscure = {
    enable = pkgs.lib.mkDefault true;
  };
}
