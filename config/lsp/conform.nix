{
  pkgs,
  lib,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      formatters_by_ft = {
        nix = ["alejandra"];
        nix = [ "nixpkgs_fmt" ];

        # Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        _ = {
          command = "${pkgs.gawk}/bin/gawk";
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        alejandra = {
          command = lib.getExe pkgs.alejandra;
        };

        nixpkgs_fmt = {
          command = lib.getExe pkgs.nixpkgs_fmt;
        };
      };
    };
  };
}
