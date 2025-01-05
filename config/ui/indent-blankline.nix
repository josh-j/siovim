{pkgs, ...}: {
  plugins.indent-blankline = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      indent = {
        char = "│"; # "│" or "▎"
        tab_char = "│";
      };
      scope.enabled = false;
      exclude.filetypes = [
        "help"
        "alpha"
        "snacks_dashboard"
        "snacks"
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
