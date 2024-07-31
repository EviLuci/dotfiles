return {
    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_y, {
                'filesize',
                cond = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end
            })
            table.insert(opts.sections.lualine_c, {
                function() return '%=' end
            })
            table.insert(opts.sections.lualine_c, {
                -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then return msg end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' LSP:'
            })
        end
    }
}
