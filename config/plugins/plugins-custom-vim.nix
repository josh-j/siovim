{pkgs, ...}: let
  powershell-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "powershell";
    version = "2024-08-01"; # Replace with the actual date of the commit you want to use
    src = pkgs.fetchFromGitHub {
      owner = "TheLeoP";
      repo = "powershell.nvim";
      rev = "06110ac2e13e495a70a9f9a5781ef7ca091c9d3d"; # Replace with the commit hash
      hash = "sha256-nUBj6aEZa3xxuKawshvOovxAnnSKinmDDmQdlgHEeuk="; # Replace with the sha256 hash
    };
    meta.homepage = "https://github.com/TheLeoP/powershell.nvim";
  };
  modicator-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "modicator";
    version = "2024-10-21";
    src = pkgs.fetchFromGitHub {
      owner = "mawkler";
      repo = "modicator.nvim";
      rev = "e349636d905e03305f1eda9c081e63560598f118";
      hash = "sha256-mmO0IYe02tYXm2cT0PT6u5Aa+3GDCidQ8YW75oXOPwQ=";
    };
  };
in {
  extraPlugins = [
    {
      plugin = powershell-nvim;
      config = "lua require('powershell').setup({ bundle_path = '/Users/joshj/Source/PowerShellEditorServices' })";
    }
    {
      plugin = modicator-nvim;
      config = ''
        lua require('modicator').setup({
          show_warnings = false,
          highlights = { use_cursorline_background = true },
          integration = {
            lualine = false
          }
        })
      '';
    }
  ];
}
