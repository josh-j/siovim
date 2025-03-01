{pkgs, ...}: let
  # powershell-nvim = pkgs.vimUtils.buildVimPlugin {
  #   pname = "powershell";
  #   version = "2024-08-01";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "TheLeoP";
  #     repo = "powershell.nvim";
  #     rev = "06110ac2e13e495a70a9f9a5781ef7ca091c9d3d";
  #     hash = "sha256-nUBj6aEZa3xxuKawshvOovxAnnSKinmDDmQdlgHEeuk=";
  #   };
  #   meta.homepage = "https://github.com/TheLeoP/powershell.nvim";
  # };

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

  oxocarbon = pkgs.vimUtils.buildVimPlugin {
    pname = "oxocarbon";
    version = "2024-02-02";
    src = pkgs.fetchgit {
      url = "https://github.com/nyoom-engineering/oxocarbon.nvim";
      rev = "c5846d10cbe4131cc5e32c6d00beaf59cb60f6a2";
      sha256 = "++JALLPklok9VY2ChOddTYDvDNVadmCeB98jCAJYCZ0=";
    };
  };


  auto-dark-mode = pkgs.vimUtils.buildVimPlugin {
    pname = "auto-dark-mode-nvim";
    version = "2025-01-25";
    src = pkgs.fetchFromGitHub {
      owner = "f-person";
      repo = "auto-dark-mode.nvim";
      rev = "2ef9553e2a1d6e861bc6955d58ce5883d28a6ad";
      sha256 = "sha256-FTXakglUrqifEXjzES6M4L+rthItu5rlw6QyIOLYNOc=";
    };
  };
in {
  extraPlugins = [
    # {
    #   plugin = powershell-nvim;
    #   config = "lua require('powershell').setup({ bundle_path = '${pkgs.powershell-editor-services}/lib/PowerShellEditorServices' })";
    # }
    {
      plugin = modes-nvim;
      config = "lua require('modes').setup({colors = {copy = '#f5c359',delete = '#c75c6a',insert = '#415c63',visual = '#64488a'},line_opacity = 0.75,set_cursor = true,set_cursorline = true,set_number = true,ignore_filetypes = {'NvimTree', 'TelescopePrompt'}})";
    }
    {
      plugin = oxocarbon;

      config = ''
        lua <<EOF
        vim.opt.background = 'dark'
        vim.cmd([[colorscheme oxocarbon]])
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#232323" })
        EOF
      '';
    }
    {
      plugin = auto-dark-mode;

      # config = ''
      #   lua <<EOF
      #   vim.opt.background = 'dark'
      #   vim.cmd([[colorscheme oxocarbon]])
      #   vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#232323" })
      #   EOF
      # '';
    }
  ];
}
