-- Only configure netrw if not in VSCode
if vim.g.vscode then return end

-- Customize netrw settings
vim.g.netrw_banner = 0       -- 0 to disable startup banner
vim.g.netrw_liststyle = 3    -- Tree-style view (vs. thin or wide)
vim.g.netrw_browse_split = 4 -- Open files in previous window (smart split)
vim.g.netrw_altv = 1         -- Open files in vertical split
vim.g.netrw_winsize = 20     -- Set width when splitting vertically
vim.g.netrw_keep = 1         -- Keep netrw window open after closing file
vim.g.netrw_preview = 1      -- Preview files (open in preview window with "p")
vim.g.netrw_fastbrowse = 0   -- Enable full tree view
vim.g.netrw_hide = 0         -- Show hidden files, 1 to hide
vim.g.netrw_silent = 1       -- Reduce noise

-- Better netrw colors
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.cmd("setl winfixwidth")
        vim.cmd("setl signcolumn=no")
        vim.cmd("highlight! link netrwDir Directory")
        vim.cmd("highlight! link netrwClassify Comment")
    end
})

-- Toggle netrw as sidebar (right side)
vim.keymap.set("n", "<localleader>e", function()
    -- Get current netrw buffer
    local netrw_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "netrw" then
            netrw_buf = buf
            break
        end
    end

    if netrw_buf then
        -- Netrw is open, close it
        vim.cmd("Lexplore")
    else
        -- Netrw is closed, open it on the right
        vim.cmd("vertical rightbelow Lexplore")

        -- Set netrw to tree style and proper width
        vim.defer_fn(function()
            vim.cmd("setl winfixwidth")   -- Fixed width
            vim.cmd("setl number")        -- Show line numbers
            vim.cmd("setl signcolumn=no") -- Clean look
        end, 10)
    end
end, {
    desc = "Toggle file explorer sidebar",
    noremap = true,
    silent = true
})

-- Refresh netrw (useful when adding/deleting files)
vim.keymap.set("n", "<localleader>er", function()
    local netrw_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "netrw" then
            netrw_buf = buf
            break
        end
    end

    if netrw_buf then
        vim.api.nvim_set_current_buf(netrw_buf)
        vim.cmd("Rexplore")
        -- Return to previous buffer
        vim.cmd("wincmd p")
    else
        vim.notify("Netrw not open", vim.log.levels.WARN)
    end
end, {
    desc = "Refresh file explorer",
    noremap = true,
    silent = true
})

-- Open netrw in current file's directory (one-time)
vim.keymap.set("n", "<localleader>E", function()
    vim.cmd("edit %:p:h")
end, {
    desc = "Open file explorer in current directory",
    noremap = true,
    silent = true
})
