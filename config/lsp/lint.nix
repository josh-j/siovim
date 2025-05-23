# lint.nix
{ pkgs, ... }: {
  plugins.lint = {
    enable = true;
    lintersByFt = {
      nix = [ "statix" "deadnix" ];
      python = [ "pylint" "mypy" ];
      ruby = [ "rubocop" ];
      markdown = [ "markdownlint" ];
      dockerfile = [ "hadolint" ];
      fish = [ "fish" ];
      css = [ "stylelint" ];
      sql = [ "sqlfluff" ];
    };

    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      # group = "lint";
      event = [ "BufEnter" "BufWritePost" "InsertLeave" ];
    };
  };
}
