# lspsaga.nix
{
  plugins = {
    lspsaga = {
      enable = true;
      beacon.enable = true;
      ui.border = "rounded"; # One of none, single, double, rounded, solid, shadow
      hover = {
        openCmd = "!firfox";
        openLink = "gx";
      };
      symbolInWinbar = {
        enable = true; # Breadcrumbs
        showFile = true;
      };

      codeAction = {
        showServerName = true;
        numShortcut = false;
        onlyInCursor = false;
        keys = {
          exec = "<CR>";
          quit = [
            "<Esc>"
            "q"
          ];
        };
      };

      lightbulb = {
        enable = false; # buggy
        sign = true;
        debounce = 250;
        signPriority = 40;
      };

      rename.keys = {
        exec = "<CR>";
        quit = [
          "<C-k>"
          "<Esc>"
        ];
        select = "x";
      };

      outline = {
        closeAfterJump = true;
        layout = "normal"; # normal or float
        winPosition = "right"; # left or right
        keys = {
          jump = "e";
          quit = "q";
          toggleOrJump = "o";
        };
      };

      scrollPreview = {
        scrollUp = "<C-d>";
        scrollDown = "<C-u>";
      };
    };
  };
}
