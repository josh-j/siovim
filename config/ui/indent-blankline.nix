{pkgs, ...}: {
  plugins.indent-blankline = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      indent.char = "│";
      whitespace.remove_blankline_trail = true;
      exclude.filetypes = [
        "help"
        "alpha"
        "snacks_dashboard"
        "dashboard"
        "neo-tree"
        "lazy"
        "notify"
        "toggleterm"
        "lazyterm"
        "lspinfo"
        "packer"
        "checkhealth"
        "help"
        "man"
        "gitcommit"
        "TelescopePrompt"
        "TelescopeResults"
        "\'\'"
      ];
    };
  };
}
