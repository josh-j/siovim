{pkgs, ...}: {
  plugins.treesitter-context = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      max_lines = 4;
      separator = "-";
    };
  };
}
