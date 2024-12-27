{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = {
        style = "glpyh";
      };
      animate = {
        cursor.enable = false;
        scroll.enable = false;
        resize.enable = false;
        open.enable = false;
        close.enable = false;
      };
      indentscope = {
        options = {
          try_as_border = true;
          border = "both";
        };
        symbol = "¦";
      };
      bufremove = {};
      files = {
        windows.preview = true;
        windows.width_preview = 60;
      };
      move = {};
    };
  };
}