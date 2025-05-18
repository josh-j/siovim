# Helix Keybindings for Neovim

This configuration adds Helix-inspired keybindings to Neovim, focusing on Normal mode movement and editing commands.

## Implemented Keybindings

### Find/Till Commands

In Helix, unlike Vim, the find/till commands (f, F, t, T) are not confined to the current line:

- `f` - Find next character (not line-confined)
- `F` - Find previous character (not line-confined)
- `t` - Find till next character (not line-confined)
- `T` - Find till previous character (not line-confined)
- `Alt-.` - Repeat last motion

### Case Switching

- `~` - Switch case of selected text
- `` ` `` - Set selected text to lowercase
- `Alt-`` - Set selected text to uppercase

### Jump Navigation

- `Ctrl-i` - Jump forward on the jumplist
- `Ctrl-o` - Jump backward on the jumplist
- `Ctrl-s` - Save selection to the jumplist

### History Navigation

- `Alt-u` - Move backward in history
- `Alt-U` - Move forward in history

### Selection Manipulation

- `%` - Select entire file
- `x` - Select current line, if already selected, extend to next line
- `X` - Extend selection to line bounds (line-wise selection)
- `Alt-x` - Shrink selection to line bounds
- `s` - Select all regex matches inside selections
- `S` - Split selection into sub selections on regex matches
- `Alt-s` - Split selection on newlines
- `Alt-minus` - Merge selections
- `Alt-_` - Merge consecutive selections
- `J` - Join lines inside selection
- `Alt-J` - Join lines inside selection and select the inserted space
- `K` - Keep selections matching the regex
- `Alt-K` - Remove selections matching the regex

### Tree-sitter Integration

- `Alt-o`, `Alt-up` - Expand selection to parent syntax node
- `Alt-i`, `Alt-down` - Shrink syntax tree object selection
- `Alt-p`, `Alt-left` - Select previous sibling node in syntax tree
- `Alt-n`, `Alt-right` - Select next sibling node in syntax tree
- `Alt-a` - Select all sibling nodes in syntax tree
- `Alt-I`, `Alt-Shift-down` - Select all children nodes in syntax tree
- `Alt-e` - Move to end of parent node in syntax tree
- `Alt-b` - Move to start of parent node in syntax tree

## Notes

- Some of the more complex Helix features, especially those related to multiple selections, may require additional plugins or more complex Lua implementations.
- The tree-sitter integration depends on the specific tree-sitter setup in your Neovim configuration.
- Some keybindings may conflict with existing Vim/Neovim keybindings, so be careful about overriding them.
