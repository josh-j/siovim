{
  inputs,
  system,
  pkgs,
  ...
}: {
  extraConfigLua = ''
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          require('lsp_signature').on_attach({}, bufnr)
        end,
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          silent = true,
        }
      )
    '';

  plugins = {
    lsp = {
      enable = pkgs.lib.mkDefault true;
      servers.typos_lsp.enable = pkgs.lib.mkDefault false;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
      servers = {
        bashls.enable = pkgs.lib.mkDefault true;
        dockerls.enable = pkgs.lib.mkDefault true;
        gopls.enable = pkgs.lib.mkDefault true;
        jsonls.enable = pkgs.lib.mkDefault true;
        marksman.enable = pkgs.lib.mkDefault true;
        nil_ls.enable = pkgs.lib.mkDefault true;
        pyright.enable = pkgs.lib.mkDefault true;
        ts_ls.enable = pkgs.lib.mkDefault true;
        lua_ls.enable = pkgs.lib.mkDefault true;
        tailwindcss.enable = pkgs.lib.mkDefault true;
        tinymist.enable = pkgs.lib.mkDefault true;
        cssls.enable = pkgs.lib.mkDefault true;
        html.enable = pkgs.lib.mkDefault true;
        htmx.enable = pkgs.lib.mkDefault true;
        solargraph.enable = pkgs.lib.mkDefault true;
        yamlls.enable = pkgs.lib.mkDefault true;
        taplo.enable = pkgs.lib.mkDefault true;
        # powershell_es.enable = true;
        # powershell_es.package = inputs.fuyuNoNur.packages.${system}.powershell_es;
      };
    };

    lint.enable = pkgs.lib.mkDefault true;
    lsp-format.enable = pkgs.lib.mkDefault true;
    lsp-signature.enable = pkgs.lib.mkDefault true;

  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
