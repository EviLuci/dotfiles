-- Core keymap loader. Sets leader and sources modular keymap files.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load keymap modules
require("core.keymaps.general")
require("core.keymaps.window")
require("core.keymaps.editing")
require("core.keymaps.diagnostic")
