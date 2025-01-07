{pkgs, ...}: let
  powershell-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "powershell";
    version = "2024-08-01";
    src = pkgs.fetchFromGitHub {
      owner = "TheLeoP";
      repo = "powershell.nvim";
      rev = "06110ac2e13e495a70a9f9a5781ef7ca091c9d3d";
      hash = "sha256-nUBj6aEZa3xxuKawshvOovxAnnSKinmDDmQdlgHEeuk=";
    };
    meta.homepage = "https://github.com/TheLeoP/powershell.nvim";
  };

  modes-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "modes-nvim";
    version = "2024-12-17";
    src = pkgs.fetchFromGitHub {
      owner = "mvllow";
      repo = "modes.nvim";
      rev = "c7a4b1b383606832aab150902719bd5eb5cdb2b0";
      hash = "sha256-ShIK8ROowT1yFHgSIVHUFnnQOEMr3YPIqw4ixzR8w8M=";
    };
  };
in {
  extraPlugins = [
    {
      plugin = powershell-nvim;
      config = "lua require('powershell').setup({ bundle_path = '/Users/joshj/Source/PowerShellEditorServices' })";
    }
    {
      plugin = modes-nvim;
      config = "lua require('modes').setup({colors = {copy = '#f5c359',delete = '#c75c6a',insert = '#415c63',visual = '#64488a'},line_opacity = 0.75,set_cursor = true,set_cursorline = true,set_number = true,ignore_filetypes = {'NvimTree', 'TelescopePrompt'}})";
    }
  ];
}
