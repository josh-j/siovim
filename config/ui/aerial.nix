{

  plugins.aerial = {
    enable = true;
    settings = {
      backends = [ "lsp" "treesitter" ];
      layout = {
        default_direction = "right";
        placement = "edge";
      };
      close_on_select = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>AerialToggle<cr>";
      options.desc = "Toggle outline";
    }
  ];
}
