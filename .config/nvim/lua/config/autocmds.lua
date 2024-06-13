-- Auto toggle hlsearch
local ns = vim.api.nvim_create_namespace "toggle_hlsearch"
local function toggle_hlsearch(char)
    if vim.fn.mode() == "n" then
        local keys = {
            "<CR>",
            "n",
            "N",
            "*",
            "#",
            "?",
            "/"
        }
        local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

        if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
    end
end
vim.on_key(toggle_hlsearch, ns)

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "json",
        "jsonc",
        "markdown"
    },
    callback = function() vim.opt.conceallevel = 0 end
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({
    "InsertLeave",
    "WinEnter"
}, {
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
        if ok and cl then
            vim.wo.cursorline = true
            vim.api.nvim_win_del_var(0, "auto-cursorline")
        end
    end
})
vim.api.nvim_create_autocmd({
    "InsertEnter",
    "WinLeave"
}, {
    callback = function()
        local cl = vim.wo.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
            vim.wo.cursorline = false
        end
    end
})
-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("better_backup", {
        clear = true
    }),
    callback = function(event)
        local file = vim.uv.fs_realpath(event.match) or event.match
        local backup = vim.fn.fnamemodify(file, ":p:~:h")
        backup = backup:gsub("[/\\]", "%%")
        vim.go.backupext = backup
    end
})

vim.filetype.add({
    extension = {
        overlay = "dts",
        keymap = "dts"
        -- conf = "dosini",
    }
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local commentstrings = {
            dts = "// %s"
        }
        local ft = vim.bo.filetype
        if commentstrings[ft] then vim.bo.commentstring = commentstrings[ft] end
    end
})
