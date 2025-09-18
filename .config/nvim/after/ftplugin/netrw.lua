-- Basic buffer settings
vim.bo.buflisted = false
vim.wo.number = false
vim.wo.signcolumn = 'no'
vim.wo.winfixwidth = true

-- Quick navigation
vim.keymap.set('n', 'h', '-', { buffer = true, remap = true })    -- Go up
vim.keymap.set('n', 'l', '<CR>', { buffer = true, remap = true }) -- Go inside

-- Escape to close netrw (much more intuitive)
vim.keymap.set('n', '<Esc>', '<cmd>bd<cr>', {
    buffer = true,
    noremap = true,
    silent = true,
    desc = 'Close explorer'
})

-- Pretty winbar
local path = vim.fn.expand('%:p:~')
vim.opt_local.winbar = '  ' .. path
