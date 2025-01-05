{pkgs, ...}: {
  plugins.todo-comments = {
    enable = pkgs.lib.mkDefault true;
      settings = {
        mergeKeywords = pkgs.lib.mkDefault true;
        highlight = {
          before = "";
          after = "fg";
          keyword = "wide";
        };
        keywords = {
          QUESTION = {
            icon = "";
          };
        };
      };
  };
}
