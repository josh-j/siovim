{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    # {
    #   plugin = tinted-vim;
    #   config = ''
    #     lua require('tint').setup()
    #     vim.cmd.colorscheme('base16-ayu-dark')
    #     vim.g.tinted_background_transparent = 1
    #   '';
    # }
  ];
  # plenary-nvim
  # vim-repeat
  # lspkind-nvim
  # zen-mode-nvim
  # twilight-nvim
  # nui-nvim # FIXME
  # vim-just
  # {
  #   plugin = tint-nvim;
  #   config = "lua require('tint').setup()";
  # }
  # {
  #   plugin = nvim-surround;
  #   config = "lua require('nvim-surround').setup({move_cursor=false})";
  # }
  # {
  #   plugin = treesj;
  #   config = "lua require('treesj').setup({use_default_keymaps=false})";
  # }
}
