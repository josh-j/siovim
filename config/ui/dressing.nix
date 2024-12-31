{
  plugins.dressing = {
    enable = false;
    settings = {
      input = {
        enabled = true;
        relative = "win";
      };
      select = {
        enabled = true;
        backend = [
          "telescope"
          "fzf_lua"
          "fzf"
          "builtin"
          "nui"
        ];
      };
    };
  };
}
