# keymaps-general.nix
{
  config.globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  config.keymaps = [
    # Make <space> do nothing in normal, visual, and operator-penidng
    {
      mode = ["n" "v" "o"];
      key = "<Space>";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      action = ":bnext<cr>";
      key = "<C-]>"; # Note: <C-]> is often 'go to definition' (tag). Consider if this is intended.
      mode = "n";
    }
    # Terminal escape back to nvim
    {
      action = "<C-\\><C-n>";
      key = "<Esc>";
      mode = "t";
      options.desc = "Escape from terminal mode"; # Added desc
    }

    # Window navigation
    {
      action = "<C-w>h";
      key = "<C-h>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move to the window on the left";
      };
    }
    {
      action = "<C-w>j";
      key = "<C-j>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move to the window below";
      };
    }
    {
      action = "<C-w>k";
      key = "<C-k>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move to the window above";
      };
    }
    {
      action = "<C-w>l";
      key = "<C-l>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move to the window on the right";
      };
    }

    # Tab navigation
    {
      action = "<cmd>tabprevious<CR>";
      key = "[t";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Previous tab";
      };
    }
    {
      action = "<cmd>tabnext<CR>";
      key = "]t";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Next tab";
      };
    }

    # Resize window with Ctrl + arrow keys
    {
      action = "<cmd>resize +4<CR>";
      key = "<C-Up>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Increase window height";
      };
    }
    {
      action = "<cmd>resize -4<CR>";
      key = "<C-Down>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Decrease window height";
      };
    }
    {
      action = "<cmd>vertical resize +4<CR>";
      key = "<C-Left>"; # Note: <C-Left> might be captured by terminal/tmux
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Increase window width";
      };
    }
    {
      action = "<cmd>vertical resize -4<CR>";
      key = "<C-Right>"; # Note: <C-Right> might be captured by terminal/tmux
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Decrease window width";
      };
    }

    # Navigate buffers
    {
      action = "<cmd>bprevious<CR>";
      key = "[b";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      action = "<cmd>bnext<CR>";
      key = "]b";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Next buffer";
      };
    }

    # Move text up and down
    {
      action = "<cmd>move .+1<CR>==";
      key = "<A-j>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move line down";
      };
    }
    {
      action = "<cmd>move .-2<CR>==";
      key = "<A-k>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Move line up";
      };
    }
    # Move text up and down in visual mode
    {
      action = ":move '>+1<CR>gv=gv";
      key = "<A-j>";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Move selected lines down"; # Refined desc
      };
    }
    {
      action = ":move '<-2<CR>gv=gv";
      key = "<A-k>";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Move selected lines up"; # Refined desc
      };
    }

    # Turn off search highlight
    {
      action = "<cmd>nohlsearch<CR>"; # Changed to nohlsearch for clarity
      key = "<C-n>"; # This might conflict with other <C-n> uses, e.g. completion
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Clear search highlight";
      };
    }
    # Clear search with ESC (This is a common one)
    {
      mode = [
        "n"
        "i"
      ]; # Added "i" for insert mode too if desired
      key = "<esc>";
      action = "<cmd>noh<CR><esc>";
      options = {
        noremap = true; # Make sure this is intended for ESC in insert mode
        silent = true;
        desc = "Escape and clear search highlight";
      };
    }

    # Stay in visual mode while indenting (These are good defaults)
    {
      action = "<gv";
      key = "<";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Indent left (stay in visual)";
      };
    }
    {
      action = ">gv";
      key = ">";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Indent right (stay in visual)";
      };
    }

    # Visual mode paste without yanking the replaced text
    {
      action = "\"_dP"; # Pastes from default register, after deleting selection to blackhole
      key = "p";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Paste (replace selection) without yanking";
      };
    }

    # Helix toggle comment (Assuming you have a commenting plugin like nvim-comment or mini.comment)
    # These actions (gcc, gc, etc.) are specific to such plugins.
    {
      mode = [ "n" ];
      key = "<leader>c";
      action = "gcc"; # Example: toggles current line comment
      options = {
        desc = "Toggle comment (line)";
        remap = true; # Good practice
        silent = true; # Good practice
      };
    }
    {
      mode = [ "v" ];
      key = "<leader>c";
      action = "gc"; # Example: toggles comment for visual selection
      options = {
        desc = "Toggle comment (selection)";
        remap = true;
        silent = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>C"; # Capital C for block comment
      action = "gbc"; # Example: toggles current line block comment
      options = {
        desc = "Toggle block comment (line)";
        remap = true;
        silent = true;
      };
    }
    {
      mode = [ "v" ];
      key = "<leader>C";
      action = "gb"; # Example: toggles block comment for visual selection
      options = {
        desc = "Toggle block comment (selection)";
        remap = true;
        silent = true;
      };
    }

    # Mimic Helix <leader>y (Space y: Yank selection to system clipboard)
    {
      mode = [ "n" ];
      key = "<leader>y";
      action = "\"+yy\""; # Neovim: Yank current line to system clipboard
      options = {
        desc = "Helix: Yank line to system clipboard";
        remap = true;
        silent = true;
      };
    }
    {
      mode = [ "v" ];
      key = "<leader>y";
      action = "\"+y\""; # Neovim: Yank visual selection to system clipboard
      options = {
        desc = "Helix: Yank selection to system clipboard";
        remap = true;
        silent = true;
      };
    }

    # Mimic Helix <leader>Y (Space Y: Yank main selection to system clipboard)
    {
      mode = [ "n" ];
      key = "<leader>Y";
      action = "\"+y$\""; # Neovim: Yank from cursor to end of line to system clipboard
      options = {
        desc = "Helix: Yank to EOL to system clipboard";
        remap = true;
        silent = true;
      };
    }
    {
      mode = [ "v" ];
      key = "<leader>Y";
      action = "V\"+y\""; # Neovim: Ensure linewise visual selection, then yank to system clipboard
      options = {
        desc = "Helix: Yank whole selected lines to system clipboard";
        remap = true;
        silent = true;
      };
    }

    # Mimic Helix <leader>p (Space p: Paste system clipboard after selection/cursor)
    {
      mode = [ "n" ];
      key = "<leader>p";
      action = "\"+p\""; # Neovim: Paste from system clipboard after cursor/line
      options = {
        desc = "Helix: Paste from system clipboard after";
        noremap = true;
        silent = true;
      };
    }

    # Mimic Helix <leader>P (Space P: Paste system clipboard before selection/cursor)
    {
      mode = [ "n" ];
      key = "<leader>P";
      action = "\"+P\""; # Neovim: Paste from system clipboard before cursor/line
      options = {
        desc = "Helix: Paste from system clipboard before";
        noremap = true;
        silent = true;
      };
    }

    # Mimic Helix <leader>R (Space R: Replace selections by clipboard contents)
    {
      mode = [ "n" ];
      key = "<leader>R";
      # To replace the current line: delete it without yanking, then paste from system clipboard.
      action = "\"_dd\"+P\"";
      options = {
        desc = "Helix: Replace line with system clipboard";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = [ "v" ];
      key = "<leader>R";
      # In visual mode, '"+P' (or '"+p') replaces the selection with the content of the '+' register.
      action = "\"+P\"";
      options = {
        desc = "Helix: Replace selection with system clipboard";
        noremap = true;
        silent = true;
      };
    }

     # Select all lines in buffer (Helix: % s <ret> or % x)
    {
      mode = "i";
      key = "<C-a>"; # Standard Ctrl-A in insert mode for select all
      action = "<Esc>ggVG"; # Go to normal, select all
      options = {
        desc = "Helix: Select all lines in buffer";
        remap = true;
        silent = true;
      };
    }
    {
      # Normal mode select all (Helix: %)
      mode = "n";
      key = "%";
      # This is Vim's default for go to percentage, not select all.
      # Helix '%' is select_all. For Vim, `ggVG` is select all.
      action = "ggVG";
      options = {
        desc = "Helix: Select all";
        remap = true;
        silent = true;
      };
    }

    # Join lines, keeping cursor position (Helix: J)
    {
      mode = "n";
      key = "J"; # Vim's default J already does this well. mzJ`z is a common refinement.
      action = "mzJ`z";
      options = {
        desc = "Helix: Join lines and keep cursor position";
        remap = true;
        silent = true;
      };
    }
  ];
}
