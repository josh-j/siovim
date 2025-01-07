{
  plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        comment = {
          options = {
            customCommentString = ''
              <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
            '';
          };
        };
        # Highlight word under cursor
        cursorword = {
          delay = 0;
        };
        icons = {
          style = "glpyh";
        };

        indentscope = {
          options = {
            try_as_border = true;
            border = "both";
          };
          symbol = "¦";
        };
        # # Show indent lines
        # indentscope = {
        #   symbol = "│";
        #   draw.delay = 0;
        # };
      };
    };

    ts-context-commentstring.enable = true;
  };
}
