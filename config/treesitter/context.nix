{ pkgs, ... }: {
  # The code context at the top of the editor
  plugins.treesitter-context = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      max_lines = 2;
      separator = "—";
    };
  };
}
