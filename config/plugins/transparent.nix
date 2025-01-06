{pkgs, ...}: {
  plugins.transparent = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      extra_groups = [
        "Constant"
        "NormalFloat"
        "FloatBorder"
        "EndOfBuffer"
        "Title"
        "WarningMsg"
        "GitSigns"
        "BufferLineBackcrust"
        "BufferLine"
        "BufferLineWebDevIcon"
        "BufferLineBackground"
        "BufferLineBufferSelected"
        "BufferLineBufferVisible"
        "BufferLineBufferInactive"
        "BufferLineFill"
        "BufferLineIndicatorSelected"
        "BufferLineIndicatorVisible"
        "BufferLineIndicatorInactive"
        "BufferLineSeparator"
        "BufferLineTabClose"
        "BufferLineCloseButton"
        "BufferLineCloseButtonSelected"
        "BufferLineCloseButtonVisible"
        "BufferLineCloseButtonInactive"
        "BufferLineModified"
        "BufferLineModifiedSelected"
        "BufferLineModifiedVisible"
        "BufferLineModifiedInactive"
        # "BufferLineBuffer"
        "BufferLineMiniIconsAzure"
        "BufferLineMiniIconsAzureSelected"
        "BufferLineMiniIconsAzureVisible"
        "BufferLineMiniIconsAzureInactive"
        "TelescopeNormal"
        "TelescopeBorder"
        "TelescopePrompt"
        "TelescopePromptBorder"
        "TelescopePromptNormal"
        "TelescopeResultsNormal"
        "TelescopePreviewNormal"
      ];
      exclude_groups = [
        "CursorLine"
        "CursorLineNR"
        "CursorLineSign"
        "CursorLineFold"
        "NeoTreeCursorLine"
        "StatusLine"
      ];
    };
  };
}
