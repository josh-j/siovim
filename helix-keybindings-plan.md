# Helix Keybindings Implementation Plan

This document outlines the plan for making Neovim keybindings more consistent with Helix editor bindings, focusing on Normal mode movement and editing commands.

## Implementation Strategy

We'll create a new file `config/keymaps/keymaps-helix.nix` that will contain all the Helix-inspired keybindings. Then we'll update `config/keymaps/default.nix` to import this new file.

## Keybinding Categories

### 1. Find/Till Commands

In Helix, unlike Vim, the find/till commands (f, F, t, T) are not confined to the current line. We'll implement this behavior using Lua functions:

```nix
# Find/Till Commands
{
  mode = "n";
  key = "f";
  action.__raw = ''
    function()
      local char = vim.fn.getcharstr()
      local line = vim.fn.line('.')
      local col = vim.fn.col('.')
      local found = false

      -- Search in current line first, starting from current position
      local pos = vim.fn.search(vim.fn.escape(char, '[]\\^$.*'), '', line)
      if pos > 0 and vim.fn.col('.') > col then
        found = true
      else
        -- If not found, search in subsequent lines
        vim.cmd('normal! ' .. line .. 'G' .. col .. '|')
        pos = vim.fn.search(vim.fn.escape(char, '[]\\^$.*'), '')
        if pos > 0 then
          found = true
        end
      end

      if not found then
        vim.cmd('normal! ' .. line .. 'G' .. col .. '|')
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Find next char (not line-confined)"; };
}
```

Similar implementations for `F`, `t`, and `T` commands.

Also add:

```nix
{
  mode = "n";
  key = "<A-.>";
  action.__raw = ''
    function()
      -- Repeat last motion (f, t, m, [ or ])
      vim.cmd('normal! ;')
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Repeat last motion"; };
}
```

### 2. Case Switching

```nix
# Case Switching
{
  mode = ["n" "v"];
  key = "~";
  action = "~";
  options = { noremap = true; silent = true; desc = "Helix: Switch case of selected text"; };
}
{
  mode = ["n" "v"];
  key = "`";
  action.__raw = ''
    function()
      if vim.fn.mode() == 'n' then
        vim.cmd('normal! gu$')
      else
        vim.cmd('normal! gu')
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Set selected text to lower case"; };
}
{
  mode = ["n" "v"];
  key = "<A-`>";
  action.__raw = ''
    function()
      if vim.fn.mode() == 'n' then
        vim.cmd('normal! gU$')
      else
        vim.cmd('normal! gU')
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Set selected text to upper case"; };
}
```

### 3. Jump Navigation

```nix
# Jump Navigation
{
  mode = "n";
  key = "<C-i>";
  action = "<C-i>";
  options = { noremap = true; silent = true; desc = "Helix: Jump forward on the jumplist"; };
}
{
  mode = "n";
  key = "<C-o>";
  action = "<C-o>";
  options = { noremap = true; silent = true; desc = "Helix: Jump backward on the jumplist"; };
}
{
  mode = "n";
  key = "<C-s>";
  action.__raw = ''
    function()
      vim.fn.setpos("''", vim.fn.getpos("."))
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Save selection to the jumplist"; };
}
```

### 4. History Navigation

```nix
# History Navigation
{
  mode = "n";
  key = "<A-u>";
  action = "g-";
  options = { noremap = true; silent = true; desc = "Helix: Move backward in history"; };
}
{
  mode = "n";
  key = "<A-U>";
  action = "g+";
  options = { noremap = true; silent = true; desc = "Helix: Move forward in history"; };
}
```

### 5. Selection Manipulation

```nix
# Selection Manipulation
{
  mode = "n";
  key = "%";
  action = "ggVG";
  options = { noremap = true; silent = true; desc = "Helix: Select entire file"; };
}
{
  mode = "n";
  key = "x";
  action.__raw = ''
    function()
      local mode = vim.fn.mode()
      if mode == 'n' then
        vim.cmd('normal! V')
      elseif mode == 'V' then
        vim.cmd('normal! j')
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select current line, extend to next line"; };
}
{
  mode = ["n" "v"];
  key = "X";
  action.__raw = ''
    function()
      if vim.fn.mode() == 'n' then
        vim.cmd('normal! V')
      elseif vim.fn.mode() == 'v' then
        vim.cmd('normal! V')
      elseif vim.fn.mode() == 'V' then
        -- Already in line-wise visual mode
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Extend selection to line bounds"; };
}
{
  mode = ["n" "v"];
  key = "<A-x>";
  action.__raw = ''
    function()
      if vim.fn.mode() == 'V' then
        vim.cmd('normal! v')
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Shrink selection to line bounds"; };
}
{
  mode = ["n" "v"];
  key = "s";
  action.__raw = ''
    function()
      local mode = vim.fn.mode()
      if mode == 'n' then
        -- In normal mode, prompt for regex and select matches
        vim.ui.input({ prompt = "Select regex: " }, function(input)
          if input then
            vim.cmd('normal! gg')
            vim.fn.search(input, 'c')
            vim.cmd('normal! v')
            vim.fn.search(input, 'e')
          end
        end)
      elseif mode == 'v' or mode == 'V' then
        -- In visual mode, prompt for regex and select matches within selection
        vim.ui.input({ prompt = "Select regex within selection: " }, function(input)
          if input then
            -- Store selection boundaries
            local start_line = vim.fn.line("'<")
            local end_line = vim.fn.line("'>")

            -- Exit visual mode
            vim.cmd('normal! ' .. start_line .. 'G')

            -- Search within the selection
            vim.fn.search(input, 'c', end_line)
            vim.cmd('normal! v')
            vim.fn.search(input, 'e', end_line)
          end
        end)
      end
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select all regex matches inside selections"; };
}
{
  mode = ["n" "v"];
  key = "S";
  action.__raw = ''
    function()
      vim.ui.input({ prompt = "Split on regex: " }, function(input)
        if input then
          -- Implementation would depend on multiple cursor support
          -- This is a placeholder for the concept
          vim.notify("Split selection on regex not fully implemented", vim.log.levels.INFO)
        end
      end)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Split selection on regex matches"; };
}
{
  mode = ["n" "v"];
  key = "<A-s>";
  action.__raw = ''
    function()
      -- Implementation would depend on multiple cursor support
      -- This is a placeholder for the concept
      vim.notify("Split selection on newlines not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Split selection on newlines"; };
}
{
  mode = ["n" "v"];
  key = "<A-minus>";
  action.__raw = ''
    function()
      -- Implementation would depend on multiple cursor support
      -- This is a placeholder for the concept
      vim.notify("Merge selections not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Merge selections"; };
}
{
  mode = ["n" "v"];
  key = "<A-_>";
  action.__raw = ''
    function()
      -- Implementation would depend on multiple cursor support
      -- This is a placeholder for the concept
      vim.notify("Merge consecutive selections not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Merge consecutive selections"; };
}
{
  mode = ["n" "v"];
  key = "J";
  action = "J";
  options = { noremap = true; silent = true; desc = "Helix: Join lines inside selection"; };
}
{
  mode = ["n" "v"];
  key = "<A-J>";
  action.__raw = ''
    function()
      vim.cmd('normal! J')
      vim.cmd('normal! viw')
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Join lines and select inserted space"; };
}
{
  mode = ["n" "v"];
  key = "K";
  action.__raw = ''
    function()
      vim.ui.input({ prompt = "Keep selections matching: " }, function(input)
        if input then
          -- Implementation would depend on multiple cursor support
          -- This is a placeholder for the concept
          vim.notify("Keep selections matching regex not fully implemented", vim.log.levels.INFO)
        end
      end)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Keep selections matching regex"; };
}
{
  mode = ["n" "v"];
  key = "<A-K>";
  action.__raw = ''
    function()
      vim.ui.input({ prompt = "Remove selections matching: " }, function(input)
        if input then
          -- Implementation would depend on multiple cursor support
          -- This is a placeholder for the concept
          vim.notify("Remove selections matching regex not fully implemented", vim.log.levels.INFO)
        end
      end)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Remove selections matching regex"; };
}
```

### 6. Tree-sitter Integration

```nix
# Tree-sitter Integration
{
  mode = ["n" "v"];
  key = "<A-o>";
  action.__raw = ''
    function()
      vim.cmd('normal! vaf')
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Expand selection to parent syntax node"; };
}
{
  mode = ["n" "v"];
  key = "<A-up>";
  action.__raw = ''
    function()
      vim.cmd('normal! vaf')
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Expand selection to parent syntax node"; };
}
{
  mode = ["n" "v"];
  key = "<A-i>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Shrink syntax tree selection not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Shrink syntax tree object selection"; };
}
{
  mode = ["n" "v"];
  key = "<A-down>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Shrink syntax tree selection not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Shrink syntax tree object selection"; };
}
{
  mode = ["n" "v"];
  key = "<A-p>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select previous sibling node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select previous sibling node in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-left>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select previous sibling node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select previous sibling node in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-n>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select next sibling node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select next sibling node in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-right>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select next sibling node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select next sibling node in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-a>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select all sibling nodes not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select all sibling nodes in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-I>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select all children nodes not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select all children nodes in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-Shift-down>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Select all children nodes not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Select all children nodes in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-e>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Move to end of parent node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Move to end of parent node in syntax tree"; };
}
{
  mode = ["n" "v"];
  key = "<A-b>";
  action.__raw = ''
    function()
      -- Implementation depends on treesitter integration
      vim.notify("Move to start of parent node not fully implemented", vim.log.levels.INFO)
    end
  '';
  options = { noremap = true; silent = true; desc = "Helix: Move to start of parent node in syntax tree"; };
}
```

## Implementation Steps

1. Create a new file `config/keymaps/keymaps-helix.nix` with the keybindings described above.

2. Update `config/keymaps/default.nix` to import the new file:

```nix
{
  imports = [
    ./keymaps-general.nix
    ./keymaps-plugins.nix
    ./keymaps-helix.nix  # Add this line
    ./whichkey.nix
  ];
}
```

3. Test the keybindings to ensure they work as expected.

## Notes on Implementation

- Some of the more complex Helix features, especially those related to multiple selections, may require additional plugins or more complex Lua implementations.
- The tree-sitter integration will depend on the specific tree-sitter setup in your Neovim configuration.
- Some keybindings may conflict with existing Vim/Neovim keybindings, so we'll need to be careful about overriding them.
