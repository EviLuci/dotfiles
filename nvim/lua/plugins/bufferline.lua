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
    }
}
