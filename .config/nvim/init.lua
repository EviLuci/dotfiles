-- Entry point for Neovim configuration.
-- Core keymap loader. define <leader> and <localleader> keys
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("\\")

-- Only set colorscheme in real Neovim (not VSCode)
if not vim.g.vscode then
    -- vim.cmd.colorscheme("tokyonight-night")
end
