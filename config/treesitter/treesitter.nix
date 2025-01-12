{pkgs, ...}: {
  plugins = {
    treesitter = {
    enable = pkgs.lib.mkDefault true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = true;
        indent.enable = true;
      };
      nixvimInjections = true;
    };
    treesitter-context.enable = true;
  };
}
