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

