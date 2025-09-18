-- Only configure netrw if not in VSCode
if vim.g.vscode then return end

-- Customize netrw settings
vim.g.netrw_banner = 0       -- 0 to disable startup banner
vim.g.netrw_liststyle = 3    -- Tree-style view (vs. thin or wide)
vim.g.netrw_browse_split = 4 -- Open files in previous window (smart split)
vim.g.netrw_altv = 1         -- Open files in vertical split
vim.g.netrw_winsize = 15     -- Set width when splitting vertically
vim.g.netrw_keepdir = 0      -- Keep current dir when browsing
vim.g.netrw_preview = 1      -- Preview files (open in preview window with "p")
vim.g.netrw_fastbrowse = 0   -- Enable full tree view
vim.g.netrw_hide = 0         -- Show hidden files, 1 to hide
vim.g.netrw_silent = 1       -- Reduce noise

function _G.toggle_netrw()
    local current_ft = vim.bo.filetype

    if current_ft == 'netrw' then
        -- If we're in netrw, close it
        vim.api.nvim_command('bd')
    else
        -- Open netrw as sidebar on the right
        vim.api.nvim_command('Vex %:p:h')
    end
end

-- Toggle netrw
vim.keymap.set('n', '<localleader>e', '<cmd>lua toggle_netrw()<cr>', {
    desc = 'Toggle file explorer',
    noremap = true,
    silent = true
})

-- Refresh netrw
vim.keymap.set('n', '<localleader>er', function()
    if vim.bo.filetype == 'netrw' then
        vim.cmd('Rex')
    else
        vim.notify('Netrw not active', vim.log.levels.WARN)
    end
end, {
    desc = 'Refresh file explorer',
    noremap = true,
    silent = true
})
