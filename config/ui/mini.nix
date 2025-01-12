{
  plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        comment = {
          # options = {
          #   customCommentString = ''
          #     <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          #   '';
          # };
        };
        # Highlight word under cursor
        cursorword = {
          delay = 0;
        };
        icons = {
          # style = "glpyh";
        };

        # notify = {
        #
        # };

        indentscope = {
          options = {
            try_as_border = true;
            border = "both";
          };
          symbol = "¦";
        #   draw.delay = 0;
        };
      };
    };
  };
}
