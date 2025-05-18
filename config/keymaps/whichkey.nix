{
  plugins.which-key = {
    enable = true;
    settings = {
      icons = {
        breadcrumb = "»"; # Uses 'breadcrumb' for path to current group
        group = "+"; # Uses '+' for expandable groups
        separator = ""; # Uses '➜' like symbol for separator
      };
      win = {
        border = "rounded"; # Uses rounded borders for the which-key window
        padding = [
          1
          1
        ]; # Assuming [vertical horizontal] padding in cells. Adjust if your Nix option expects { top=1, bottom=1, ...}
      };
      spec = [
        # User's desired general groups from original spec (ensure these are actual prefixes or for labeling direct commands)
        {
          __unkeyed-1 = "<leader>.";
          mode = [
            "n"
            "v"
          ];
          group = "+code";
        }
        {
          __unkeyed-1 = "<leader>f";
          mode = ["n"];
          group = "+find/file";
        } # Helix <leader>f is direct; <leader>xf contains file extras
        {
          __unkeyed-1 = "<leader>q";
          mode = ["n"];
          group = "+quit/session";
        } # Assuming <leader>q is a prefix in your full config
        {
          __unkeyed-1 = "<leader>u";
          mode = ["n"];
          group = "+ui";
        } # Assuming <leader>u is a prefix (e.g. <leader>uC for colorscheme if not under <leader>x)
        {
          __unkeyed-1 = "<leader>w";
          mode = ["n"];
          group = "+windows";
        } # Correct, as <leader>w is a Helix prefix

        # Helix keybindings group
        {
          __unkeyed-1 = "<A->";
          mode = [
            "n"
            "v"
          ];
          group = "+helix-alt-keys";
        }

        # --- Groups for the new <leader>x structure ---
        {
          __unkeyed-1 = "<leader>x";
          mode = [
            "n"
            "v"
          ]; # Applicable in normal and visual modes
          group = "+extended-nvim"; # Main group for all <leader>x mappings
        }

        # Specific groups for sub-prefixes of <leader>x for better organization
        # These will show up when you type <leader>x and then the next key (f, l, g, d, s)
        {
          __unkeyed-1 = "<leader>xf"; # Prefix for extra file-related Telescope pickers
          mode = ["n"];
          group = "+file-extras";
        }
        {
          __unkeyed-1 = "<leader>xl"; # Prefix for LSP extra commands
          mode = [
            "n"
            "v"
          ];
          group = "+lsp-extras";
        }
        {
          __unkeyed-1 = "<leader>xg"; # Prefix for extended Git commands (Gitsigns, Fugitive, Telescope git)
          mode = [
            "n"
            "v"
          ];
          group = "+git-extras";
        }
        {
          __unkeyed-1 = "<leader>xd"; # Prefix for DAP (debug) commands
          mode = [
            "n"
            "v"
          ];
          group = "+debug-extras";
        }
        {
          __unkeyed-1 = "<leader>xs"; # Prefix for Telescope search group (marks, help_tags, keymaps, etc.)
          mode = [
            "n"
            "v"
          ];
          group = "+search-extras";
        }
        {
          __unkeyed-1 = "<leader>xx"; # Prefix for special operations like delete to void register
          mode = [
            "n"
            "v"
          ];
          group = "+special-ops";
        }

        # Note on direct Helix commands under <leader>:
        # Keys like <leader>g (git status), <leader>s (document symbols), <leader>k (hover), etc.,
        # are now direct actions as per Helix philosophy.
        # Their descriptions will come from the 'desc' field in your 'keymaps-plugins.nix'.
        # The original spec entries for '<leader>g' and '<leader>s' as groups are removed
        # because <leader>xg and <leader>xs are the dedicated prefixes now.

        # Additional prefixes
        {
          __unkeyed-1 = "<leader>xo"; # Prefix for open operations
          mode = ["n"];
          group = "+open";
        }
        {
          __unkeyed-1 = "<leader>xu"; # Prefix for utility operations
          mode = ["n"];
          group = "+utility";
        }
        {
          __unkeyed-1 = "<leader>xz"; # Prefix for zen-related operations
          mode = ["n"];
          group = "+zen";
        }
      ];
    };
  };
}
