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

  tinted-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "tinted-vim";
    version = "2025-01-04"; # Replace with the actual date of the commit you want to use
    src = pkgs.fetchFromGitHub {
      owner = "tinted-theming";
      repo = "tinted-vim";
      rev = "c2a1232aa2c0ed27dcbf005779bcfe0e0ab5e85d"; # Replace with the commit hash
      hash = "sha256-YbQwaApLFJobn/0lbpMKcJ8N5axKlW2QIGkDS5+xoSU="; # Replace with the sha256 hash
    };
    meta.homepage = "https://github.com/tinted-theming/tinted-vim";
  };
in {
  extraPlugins = [
    {
      plugin = powershell-nvim;
      config = "lua require('powershell').setup({ bundle_path = '/Users/joshj/Source/PowerShellEditorServices' })";
    }
    {
      plugin = tinted-vim;
      config = ''
        # vim.cmd.colorscheme('base16-ayu-dark')
        vim.g.tinted_background_transparent = 1
      '';
    }
  ];
}
