{
  config = {
    # feature that enhances the way Neovim loads and executes Lua modules,
    # offering improved performance and flexibility.
    luaLoader.enable = true;
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };
    diagnostics = {
      update_in_insert = true;
      severity_sort = true;
      float = {
        border = "rounded";
      };
      jump = {
        severity.__raw = "vim.diagnostic.severity.WARN";
      };
    };
    clipboard = {
      register = "unnamedplus";
    };
    editorconfig.enable = true;
    opts = {
      termguicolors = true;
      showmode = false;
      backup = false;
      cmdheight = 0;
      conceallevel = 0;
      encoding = "utf-8";
      fileencoding = "utf-8";
      title = true;
      hlsearch = true;
      incsearch = true;
      inccommand = "nosplit";
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      mouse = "a";
      ignorecase = true;
      smartcase = true;
      smartindent = false;
      splitbelow = true;
      splitright = true;
      splitkeep = "cursor";
      swapfile = false;
      undofile = true;
      updatetime = 50;
      writebackup = false;
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      cursorline = true;
      laststatus = 3;
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      wrap = true;
      scrolloff = 8;
      # Maximum number of items to show in the popup menu (0 means "use available screen space")
      pumheight = 0;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        nbsp = "␣";
      };
      list = true;
      showbreak = "↪ ";
      foldmethod = "expr";
      foldnestmax = 20;
      foldminlines = 2;
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      foldexpr = "nvim_treesitter#foldexpr()";
    };
  };
}
