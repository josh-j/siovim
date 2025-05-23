{
  plugins = {
    navic = {
      enable = true;
      settings = {
        lsp = {
          auto_attach = true;
        };
        highlight = true;
        separator = " > ";
        depth_limit = 0;
        depth_limit_indicator = "..";
      };
    };

    # Add to lualine for display
    lualine = {
      # ... your existing config
      sections = {
        lualine_c = [
          {
            __raw = ''
              function()
                return require("nvim-navic").get_location()
              end
            '';
          }
        ];
      };
    };
  };
}
