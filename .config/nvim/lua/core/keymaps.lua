-- Core keymap loader. define <leader> and <localleader> keys
-- you should use `vim.keycode` to translate keycodes or pass raw keycode values like `" "` instead of just `"<space>"`
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode(",")

-- Load keymap modules
require("core.keymaps.general")
require("core.keymaps.window")
require("core.keymaps.editing")
require("core.keymaps.diagnostic")
