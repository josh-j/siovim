{pkgs, ...}: {
  plugins.transparent = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      exclude_groups = [];
      extra_groups = [
        "BufferLineTabClose"
        "BufferLineBufferSelected"
        "BufferLineFill"
        "BufferLineBackground"
        "BufferLineSeparator"
        "BufferLineIndicatorSelected"
        "BufferLineSeparatorVisible"
        "BufferLineBackcrust"
        "BufferLineVisible"
        "BufferLineModifiedSelected"
        "TabLine"
        "TabLineFill"
        # "ColorColumn"
        "NormalFloat"
        "NvimTreeNormal"
        "NeoTreeNormal"
        "NvimTreeNormalNC"
        "NeoTreeCursorLine"
        "TelescopeNormal"
        "TelescopePrompt"
      ];
    };
  };
}
