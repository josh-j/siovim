{pkgs, ...}: {
  plugins.lualine = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      globalstatus = pkgs.lib.mkDefault true;
      theme = pkgs.lib.mkDefault "oxocarbon";
      disabledFiletypes.statusline = [
        "alpha"
      ];
      sections = {
        lualine_x = [
          "filetype"
        ];
      };
    };
  };
}
