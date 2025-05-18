{pkgs, ...}: {
  plugins.vim-matchup = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      surround_enabled = pkgs.lib.mkDefault 1;
      transmute_enabled = pkgs.lib.mkDefault 1;
    };
    treesitter = pkgs.lib.mkDefault {
      enable = pkgs.lib.mkDefault true;
    };
  };
}
