{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim # is this actually needed or is it already installed as a dependency
    # vim-repeat
    # {
    #   plugin = nvim-surround;
    #   config = "lua require('nvim-surround').setup({move_cursor=false})";
    # }
  ];
}
