{pkgs, ...}: {
  colorschemes = {
    base16 = {
      enable = true;
      # colorscheme = import ../../lib/colors/papercolor.nix;
      # colorscheme = import ../../lib/colors/git-muted-dark.nix;
      colorscheme = import ../../lib/colors/git-muted-dark.nix;
      setUpBar = true;

      settings = {
        cmp = true;
        dapui = true;
        illuminate = true;
        indentblankline = true;
        notify = true;
        lsp_semantic = true;
        mini_completion = true;
        telescope = true;
        telescope_borders = true;
        ts_rainbow = true;
      };
      luaConfig.post = ''
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = require('base16-colorscheme').colors.base04 })
      '';
    };
  };

  plugins.transparent = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      extraConfig = ''
        require('transparent').clear_prefix('lualine')
        require('transparent').clear_prefix('neogit')
        require('transparent').clear_prefix('gitsigns')
        require('transparent').clear_prefix('noice')
        require('transparent').clear_prefix('markview')
        require('transparent').clear_prefix('Telescope')
        require('transparent').clear_prefix('BufferLine')
        require('transparent').clear_prefix('NeoTree')
        '';

      extra_groups = [
        "Constant"
          "NormalFloat"
          "FloatBorder"
          "EndOfBuffer"
          "Title"
          "WarningMsg"
          "GitSigns"
      ];
# extra_groups = [
#   "Constant"
#   "NormalFloat"
#   "FloatBorder"
#   "EndOfBuffer"
#   "Title"
#   "WarningMsg"
#   "GitSigns"
#   "BufferLineBackcrust"
#   "BufferLine"
#   "BufferLineDiagnostic"
#   "BufferLineTab"
#   "BufferLineTrunch"
#   "BufferLineWebDevIcon"
#   "BufferLineDevIcon"
#   "BufferLineMiniIconsGrey"
#   "BufferLineMiniIconsGreyInactive"
#   "BufferLineBackground"
#   "BufferLineBufferSelected"
#   "BufferLineBufferVisible"
#   "BufferLineBufferInactive"
#   "BufferLineFill"
#   "BufferLineIndicator"
#   "BufferLineIndicatorSelected"
#   "BufferLineIndicatorVisible"
#   "BufferLineIndicatorInactive"
#   "BufferLineSeparator"
#   "BufferlineHint"
#   "BufferLineTabClose"
#   "BufferLineCloseButton"
#   "BufferLineCloseButtonSelected"
#   "BufferLineCloseButtonVisible"
#   "BufferLineCloseButtonInactive"
#   "BufferLineModified"
#   "BufferLineModifiedSelected"
#   "BufferLineModifiedVisible"
#   "BufferLineModifiedInactive"
#   "BufferLineMiniIconsAzure"
#   "BufferLineMiniIconsAzureSelected"
#   "BufferLineMiniIconsAzureVisible"
#   "BufferLineMiniIconsAzureInactive"
#   "BufferLineMiniIconsGrey"
#   "BufferLineMiniIconsGreySelected"
#   "BufferLineMiniIconsGreyVisible"
#   "BufferLineMiniIconsGreyInactive"
#   "BufferLineMiniIconsYellow"
#   "BufferLineMiniIconsYellowSelected"
#   "BufferLineMiniIconsYellowVisible"
#   "BufferLineMiniIconsYellowInactive"
#   "BufferLineVisibleIndex"
#   "BufferLineNumbers"
#   "BufferLineNumbersVisible"
#   "BufferLineNumbersSelected"
#   "BufferLineNumbersInactive"
#   "BufferLineError"
#   "BufferLineErrorDiagnostic"
#   "BufferLineWarning"
#   "BufferLineWarningDiagnostic"
#   "BufferLineInfo"
#   "BufferLineInfoDiagnostic"
#   "BufferLineHintDiagnostic"
#   "BufferLinePick"
#   "BufferLinePickSelected"
#   "BufferLinePickVisible"
#   "TelescopeNormal"
#   "TelescopeBorder"
#   "TelescopePrompt"
#   "TelescopePromptBorder"
#   "TelescopePromptNormal"
#   "TelescopePromptPrefix"
#   "TelescopeResultsNormal"
#   "TelescopePreviewNormal"
# ];
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
