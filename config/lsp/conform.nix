{
  pkgs,
  lib,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = true;  # Fixed: underscore instead of camelCase
        timeout_ms = 500;     # Fixed: underscore instead of camelCase
      };
      formatters_by_ft = {
        # Fixed: Choose ONE formatter for nix, not both
        nix = ["nixpkgs-fmt"];  # or ["alejandra"] - pick one
        
        # Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        # Fixed: Removed the generic "_" formatter that was incorrectly defined
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        trim_whitespace = {
          command = lib.getExe' pkgs.coreutils "sed";
          args = [ "-e" "s/[[:space:]]*$//" ];
        };
        trim_newlines = {
          command = lib.getExe' pkgs.coreutils "sed";
          args = [ "-e" ":a" "-e" "/^\\s*$/{$d;N;ba" "-e" "}" ];
        };
        alejandra = {
          command = lib.getExe pkgs.alejandra;
        };
        nixpkgs-fmt = {
          command = lib.getExe pkgs.nixpkgs-fmt;
        };
      };
    };
  };
}
