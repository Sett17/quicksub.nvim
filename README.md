# quicksub.nvim

`quicksub.nvim` is a Neovim plugin that streamlines the substitution process. With this plugin, you can visually select text and generate substitution commands interactively, making your editing workflow faster and more efficient.

## Features:

- Visually select text to be substituted.
- Interactively input range offsets for substitutions.
- Automatically generate and populate the command-line with the substitution command.

## Installation:

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'sett17/quicksub.nvim',
    as = 'quicksub',
},
```

## Usage:

After installation, `quicksub.nvim` does not have a default keybinding. You need to set it up in your Neovim configuration.

Here's an example of how to set up a keybinding for the plugin:
```lua
local qs = require('quicksub.quicksub')
vim.keymap.set("v", "<leader>s", quicksub.quicksub)
```
This will bind the quicksub function to <leader>s in visual mode.

Once activated you are going to be asked for a range:

|Input|Effect|
|:---:|------|
|`$`|Replace until end of file|
|`%`|Replace in whole file|
|`x : int`|Replace from current line until x lines after|

`quicksub` will then input the substitute command for you with cursor in the replacement.

By default, it has the `g` and `i` flags. Making it global (replacing all occurrences in a line) and case-insensitive.

If these fit fo your usecase, just start typing to replace.
