return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    keys = {
        {
            "<A-h>",
            "<cmd>BufferLineMovePrev<cr>",
            desc = "Move buffer Prev"
        },
        {
            "<A-l>",
            "<cmd>BufferLineMoveNext<cr>",
            desc = "Move buffer Next"
        },
        {
            "A-p",
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Prev buffer"
        },
        {
            "A-n",
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Next buffer"
        },
        {
            "<leader>bp",
            "<Cmd>BufferLineTogglePin<CR>",
            desc = "Toggle pin"
        },
        {
            "<leader>bc",
            "<Cmd>BufferLineGroupClose ungrouped<CR>",
            desc = "Delete non-pinned buffers"
        },
        {
            "<leader>bo",
            "<Cmd>BufferLineCloseOthers<CR>",
            desc = "Delete other buffers"
        },
        {
            "<leader>br",
            "<Cmd>BufferLineCloseRight<CR>",
            desc = "Delete buffers to the right"
        },
        {
            "<leader>bl",
            "<Cmd>BufferLineCloseLeft<CR>",
            desc = "Delete buffers to the left"
        }
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }
            }
        }
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function() vim.schedule(function() pcall(nvim_bufferline) end) end
        })
    end
}
